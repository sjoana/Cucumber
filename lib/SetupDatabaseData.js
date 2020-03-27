const pg = require('pg');
const tunnel = require('tunnel-ssh');
const fs = require('fs');
const path = require('path');
const async = require('async');
const chalk = require('chalk');
const conf = require('./config');
const getUuid = require('uuid-by-string');
const uuidv1 = require('uuid/v1');
const rp = require('request-promise');
let domain_uuid;

const pgConfig = {
    user: conf.pgUsername,
    database: conf.pgDatabase,
    password: conf.pgPassword,
    host: conf.pgHost,
    port: conf.proxyPort,
    max: 50
};
const pool = new pg.Pool(pgConfig);

function findFilesInDir (startPath,filter){

    let results = [];

    if (!fs.existsSync(startPath)){
        console.log(`Cannot found dir: ${startPath}`);
        return;
    }

    const files=fs.readdirSync(startPath);
    for(let i=0;i<files.length;i++){
        const filename=path.join(startPath,files[i]);
        const stat = fs.lstatSync(filename);

        if (stat.isDirectory()){
            results = results.concat(findFilesInDir(filename,filter)); //recurse
        }
        else if (filename.indexOf(filter)>=0) {
            results.push(filename);
        }
    }
    return results;
}

function setupAllFiles () {

    //domain_uuid = uuidv1();
    domain_uuid= '99992222-3333-4444-5555-666677778888';
    const results = findFilesInDir('testdata/GeneralScripts', '.sample');

    async.eachSeries(
        // Pass items to iterate over
        results,
        // Pass iterator function that is called for each item
        function(filename, cb) {
            fs.readFile(filename, 'utf8' , function(err, data) {
                if (err) {
                    return console.log(err)
                }
                const result = data.replace(/{{ DOMAIN }}/g, domain_uuid);

                fs.writeFile(filename.slice(0,-7), result, 'utf8', function (error) {
                    if (err)
                    {
                        return console.log(error);
                    }
                });

                cb();
            });
        }
    );

}

//Open tunnel
async function openTunnel() {
    const sshUserName = conf.username;
    const sshPassword = conf.password;

    const sshConfig = {
        host: conf.host,
        port: conf.port,
        username: sshUserName,
        password: sshPassword,
        keepaliveInterval: 60000,
        keepAlive: true,
        dstHost: '127.0.0.1',
        dstPort: conf.pgPort,
        localHost: conf.pgHost,
        localPort: conf.proxyPort
    };

    try {
        console.log(chalk.green(`Open tunnel with ${conf.host}`));
        return await tunnel(sshConfig);

    } catch (error) {
        throw new Error(error);
    }

}

//Close tunnel
async function closeTunnel(tnl) {

    try {
        console.log(chalk.green(`Close tunnel with ${conf.host}`));
        return await tnl.close();
    } catch (error) {
        throw new Error(error);
    }

}

//Execute sql files
async function runSqlFiles(files) {
    const results = [];
    for(let i=0;i<files.length;i++)
    {
        results[i] = await query(fs.readFileSync(files[i]).toString());
    }

    return [].concat.apply([], results);
}

//Execute query in database
async function query (q) {

    const client = await pool.connect();

    try {
        return await client.query(q);
    } finally {
        await client.release();
    }
}


//Create test domain
async function createDomain() {

    const file = [path.join('.', 'testdata' ,'GeneralScripts','insert_domain.sql')];

    try {
        console.log(chalk.green("Create domain with UUID: " + domain_uuid));
        return await runSqlFiles(file);
    } catch (error) {
        throw new Error(error);
    }

}

// Insert data needed to run the test
async function setupData() {

    try {
        const files = [path.join('.', 'testdata' ,'GeneralScripts','insert_public.sql'), path.join('.', 'testdata' ,'GeneralScripts','full_insert_fscontact.sql')];
        let insertedData = await runSqlFiles(files);

        if(insertedData) {
            insertedData.forEach(function (arrayItem) {
                if(arrayItem.rows.length > 0)
                {
                    fs.writeFileSync(`./testdata/DatabaseData/${Object.keys(arrayItem.rows[0])[0]}DB.json`, JSON.stringify(arrayItem.rows[0], null, 2),'utf-8',function(data, err) {
                        if(err) {
                            console.log(chalk.red(err));
                        }
                    });
                }

            });
            console.log(chalk.green("Insert related data"));
            return true;
        }

    } catch (error) {
        throw new Error(error);
    }
}

//Delete data used in test
async function tearDown() {

    try
    {
        const files = [path.join('.', 'testdata' ,'GeneralScripts','full_delete_fscontact.sql'), path.join('.', 'testdata' ,'GeneralScripts','delete_public.sql')];
        const pathDirectory = path.join('.', 'testdata' ,'DatabaseData');
        let deleteFiles = await runSqlFiles(files);

        if(deleteFiles) {
            fs.readdir(pathDirectory, (err, files) => {
                if (err) {
                    console.log(chalk.red(err));
                }

                for (const fl of files) {
                    fs.unlink(path.join(pathDirectory, fl), error => {
                        if (err){
                            console.log(chalk.red(error));
                        }
                    });
                }
            });

            console.log(chalk.green("Delete related data"));
            return true;
        }
    }
    catch(err)
    {
        console.error(err)
    }

}

function getDomainUUID() {
    return domain_uuid;
}

//Export methods
module.exports.setupData = setupData;
module.exports.createDomain = createDomain;
module.exports.tearDown = tearDown;
module.exports.setupAllFiles = setupAllFiles;
module.exports.openTunnel = openTunnel;
module.exports.closeTunnel = closeTunnel;
module.exports.domain = getDomainUUID;