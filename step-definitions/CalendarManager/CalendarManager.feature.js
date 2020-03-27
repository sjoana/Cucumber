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

Then(/^I "([^"]*)" an event$/, async (option) => {
    const calendar = client.page.CalendarManagerPage();

    switch (option) {
        case 'create':
            return await calendar.createEvent([events.events[0]]);
        case 'edit':
            return await calendar.edit(events.events[0], 'event');
        case 'delete':
            return await calendar.delete(events.events[0], 'event');
    }


});