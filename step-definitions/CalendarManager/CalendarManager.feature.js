const { client } = require('nightwatch-api');
const { Given, Then, When } = require('cucumber');
const events = require('../../testdata/CalendarManager/calendar');

Given(/^I open GoContact page$/, async () => {
    client.maximizeWindow();
    let login = client.page.LoginPage();
    return await login.navigate().signInAsAdmin(client);
});

Then(/^the go to the tab Calendar Manager$/, async () => {
    const calendar = client.page.CalendarManagerPage();
    return await calendar.goToCalendarManager();
});

Then(/^I ([^"]*) an ([^"]*)$/, async (operation, type ,data) => {
    const calendar = client.page.CalendarManagerPage();
    //console.log(data.hashes());

    switch (operation) {
        case 'create':
            return await calendar.createEvent([data.hashes()[0]]);
        case 'edit':
            return await calendar.edit([data.hashes()[0]], type);
        case 'delete':
            return await calendar.delete([data.hashes()[0]], type);
    }


});