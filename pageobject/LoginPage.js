/**
 * Page Object: Login
 * @type {{url: string, elements: {Username: {selector: string, locateStrategy: string}, Password: {selector: string, locateStrategy: string}, signin: {selector: string, locateStrategy: string}, AlertBoxAdmin: {selector: string, locateStrategy: string}, MsgNoUsername: {selector: string, locateStrategy: string}}, commands: *[]}}
 */
const conf = require('../lib/config');
module.exports = {
    url: function() {
        return "https://" + conf.host;
    },
    elements: {
        username: {
            selector: '#login-form > fieldset > section:nth-child(1) > label.input > input[type="email"]'
        },
        password: {
            selector: '#login-form > fieldset > section:nth-child(2) > label.input > input[type="password"]'
        },
        signin: {
            selector: '#login-form > footer > button'
        },
        alertBoxAdmin: {
            selector: '#newTitlediv > span'
        },
        msgNoUsername:{
            selector: '#login-form > fieldset > section:nth-child(1) > em'
        },
        logoutBtn: {
            selector: '#main-logout > span > a'
        }
    },
    commands: [{

       signInAsAdmin: function(browser) {
            return this
                .setValue('@username', conf.login.username)
                .setValue('@password', conf.login.password)
                .click('@signin');
        },

        logout: function(browser) {
           return this
               .waitForElementVisible('@logoutBtn',1000)
               .click('@logoutBtn')
        },
/*
        signInAsAdmin: function() {
            return this
                .setValue('@Username', 'admin@gvp')
                .setValue('@Password', 'n0telecom!')
                .click('@signin');
        },*/

        signInAsAgent: function(browser, username,password){
            return this
                .setValue('@username', username)
                .setValue('@password', password)
                .click('@signin');
        }
    }]
};