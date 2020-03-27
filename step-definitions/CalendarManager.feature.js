const { client } = require('nightwatch-api');
const { Given, Then, When } = require('cucumber');
const events = require('../testdata/CalendarManager/calendar');

Given(/^I open GoContact page$/, async () => {
    client.maximizeWindow();
    let login = client.page.LoginPage();
    return await login.navigate().signInAsAdmin(client);
});

Then(/^the go to the tab Calendar Manager$/, () => {
    const calendar = client.page.CalendarManagerPage();
    return calendar.goToCalendarManager();
});

Then(/^I create a new event$/, () => {
    const calendar = client.page.CalendarManagerPage();
    return calendar.createEvent([events.events[0]]);
});