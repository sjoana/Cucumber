const chromedriver = require('chromedriver');

module.exports = {
    src_folders : ["tests"], //tests is a folder in workspace which has the step definitions
    page_objects_path: 'pageobject/', //page_objects folder where selectors are saved,
    silent: true,
    detailed_output : false,
    test_settings: {
        default: {
            webdriver: {
                start_process: true,
                server_path: chromedriver.path,
                port: 4444,
                cli_args: ['--port=4444']
            },
            desiredCapabilities: {
                browserName: 'chrome',
                chromeOptions : {
                    args : ["headless", "no-sandbox", "disable-gpu", "window-size=1920,1080","incognito", 'log-level=3' ]
                },
            }
        },
    }
};