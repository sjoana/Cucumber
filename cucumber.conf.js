const myModule = require('./lib/SetupDatabaseData');
const chalk = require('chalk');
const fs = require('fs');
const path = require('path');

const { setDefaultTimeout, After, AfterAll, BeforeAll, Before } = require('cucumber');
const { createSession, closeSession, startWebDriver, stopWebDriver } = require('nightwatch-api');
const reporter = require('cucumber-html-reporter');

const attachedScreenshots = getScreenshots();
let tnl;

function getScreenshots() {
    try {
        const folder = path.resolve(__dirname, 'screenshots');

        const screenshots = fs.readdirSync(folder).map(file => path.resolve(folder, file));
        return screenshots;
    } catch (err) {
        return [];
    }
}

setDefaultTimeout(60000);

BeforeAll(async () => {
    try {
        tnl = await myModule.openTunnel();

        if(tnl)
        {
            await myModule.setupAllFiles();
            const result = await myModule.createDomain();
            if(result)
            {
                const setup = await myModule.setupData();
                if(setup)
                {
                    await startWebDriver();
                    await createSession();
                }

            }
        }

    } catch (error) {
        console.log(chalk.red(`An unexpected error occurs in before: ${error}`));
    }
});


AfterAll(async () => {

    try {
        const r = await myModule.tearDown();
        if(r)
        {
            await closeSession();
            await stopWebDriver();
            await myModule.closeTunnel(tnl);
            setTimeout(() => {
                reporter.generate({
                    theme: 'bootstrap',
                    jsonFile: 'report/cucumber_report.json',
                    output: 'report/cucumber_report.html',
                    reportSuiteAsScenarios: true,
                    screenshotsDirectory: 'screenshots/',
                    scenarioTimestamp: true,
                    launchReport: false,
                    ignoreBadJsonFile: true,
                    noInlineScreenshots:true,
                    storeScreenshots: true,
                    metadata: {
                        'App Version': '0.3.2',
                        'Test Environment': 'POC'
                    }
                });
            }, 0);
        }
    } catch (error) {
        console.log(chalk.red(`An unexpected error occurs in afterEach: ${error}`));
    }

});

After(async function() {

    return Promise.all(
        getScreenshots()
            .filter(file => !attachedScreenshots.includes(file))
            .map(file => {
                attachedScreenshots.push(file);
                return this.attach(fs.readFileSync(file), 'image/png');
            })
    );
});