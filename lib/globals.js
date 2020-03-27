const myModule = require('./SetupDatabaseData');
const chalk = require('chalk');
let tnl;

module.exports = {
    asyncHookTimeout: 20000,

    // External before hook: é executado no inicio do teste ser executado, antes de criar a sessão selenium
    before: async function () {
        try {
            tnl = await myModule.openTunnel();

            if(tnl)
            {
                await myModule.setupAllFiles();
            }

        } catch (error) {
            console.log(chalk.red(`An unexpected error occurs in before: ${error}`));
        }
    },

    // External before hook: é executado no fim do teste ser executado, antes de fechar a sessão selenium
    after: async function () {

        try {
            await myModule.closeTunnel(tnl);

        } catch (error) {
            console.log(chalk.red(`An unexpected error occurs in after: ${error}`));

        }

    },

    // External beforeEach hook: é executado no inicio do testsuite
    beforeEach: async function()
    {

        try {
            const result = await myModule.createDomain();
            if(result)
            {
                await myModule.setupData();

            }

        } catch (error) {
            console.log(chalk.red('An unexpected error occurs: ' + error));

        }

    },

    // External afterEach hook: é executado no fim do testsuite
    afterEach: async function(done)
    {
        try {
            await myModule.tearDown();

        } catch (error) {
            console.log(chalk.red(`An unexpected error occurs in afterEach: ${error}`));

        }

    },

    // External beforeEachTest hook: é executado no inicio de cada teste
    beforeEachTest: async function (browser, done) {

        browser.maximizeWindow();
        let login = browser.page.LoginPage();

        login.navigate().signInAsAdmin(browser);

        done();
        return browser;

    }
};