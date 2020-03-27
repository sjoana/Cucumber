const util = require('util');
const moment = require('moment');

module.exports = {
    elements: {
        menu: {
            selector: '#left-panel > span > i'
        },
        calendar: {
            selector: '#menu_9'
        },
        calendarManager: {
            selector: '#menu_40 > span'
        },

        //Events
        addEventBtn: {
            selector: 'a.btn.btn-link.add-event-btn'
        },
        eventNameInput: {
            selector: '//input[@name="eventName"]',
            locateStrategy: 'xpath'
        },
        eventDescriptionTextArea: {
            selector: '//textarea[@name="eventDescription"]',
            locateStrategy: 'xpath'
        },
        colorBtn: {
            selector: 'a.dropdown-toggle.btn.btn-primary.btn-sm.event-color-menu-anchor'
        },
        durationEventSpinner: {
            selector: '//input[@name="eventDuration"]',
            locateStrategy: 'xpath'
        },
        startTimeEvent: {
            selector: '//input[@name="allowedStartTime"]',
            locateStrategy: 'xpath'
        },
        endTimeEvent: {
            selector: '//input[@name="allowedEndTime"]',
            locateStrategy: 'xpath'
        },
        preEventSpinner: {
            selector: '//input[@name="preEventTime"]',
            locateStrategy: 'xpath'
        },
        postEventSpinner: {
            selector: '//input[@name="postEventTime"]',
            locateStrategy: 'xpath'
        },
        pickColor: {
            selector: '//*[@class="dropdown-menu arrow-box-up color-select"]/li/span[contains(@title,"%s")]',
            locateStrategy: 'xpath'
        },
        saveEventBtn:{
            selector: '#eventSaveBtn'
        },
        confirmEventBtn: {
            //selector: 'button.btn.btn-primary.save-event-confirm-btn'
            selector: '//button[@class="%s"]',
            locateStrategy: 'xpath'
        },
        filterEventInput: {
            selector: '//div[@id="DataTables_Table_0_filter"]//input',
            locateStrategy: 'xpath'
        },
        editRemoveEventBtn: {
            selector: '//button[@title="%s"]',
            locateStrategy: 'xpath'
        },
        eventsTableDuration: {
            selector: '#DataTables_Table_0 > tbody > tr > td:nth-child(4)'
        },
        eventConfirmDeleteBtn:{
            selector: 'button.btn.btn-primary.remove-event-confirm-btn'
        },
        tableNoData: {
            //selector: '#DataTables_Table_0 > tbody > tr > td'
            selector: '//table[@id="%s"]/tbody/tr/td',
            locateStrategy: 'xpath'
        },
        allowConcurrentBooking: {
            selector: '//*[@id="event-form"]//label[@class="check-inline"]/span[contains(text(),"%s")]',
            locateStrategy: 'xpath'
        },

        //Calendar
        calendarTab: {
          selector: '#calendar_btn_tab2'
        },
        addCalendarBtn: {
            selector: 'a.btn.btn-link.btn-create.add-calendar-btn'
        },
        calendarNameInput: {
            selector: '//input[@name="calendar_form_name"]',
            locateStrategy: 'xpath'
        },
        calendarRefInput: {
            selector: '//input[@name="calendar_form_ref"]',
            locateStrategy: 'xpath'
        },
        calendarStartInput: {
            selector: '//input[@name="calendar_form_start_time"]',
            locateStrategy: 'xpath'
        },
        calendarEndInput: {
            selector: '//input[@name="calendar_form_end_time"]',
            locateStrategy: 'xpath'
        },
        calendarStartInput: {
            selector: '//input[@name="calendar_form_start_time"]',
            locateStrategy: 'xpath'
        },
        calendarEventsInput: {
            selector: 'input.select2-input'
        },
        temporalExclusions: {
            selector: '//input[@name="temporal_exclusions"]',
            locateStrategy: 'xpath'
        },
        weekDay: {
            selector: '//button[@name="%s"]',
            locateStrategy: 'xpath'
        },
        exclusionStartTime: {
          selector: '//input[@name="exclusion_start_time"]',
          locateStrategy: 'xpath'
        },
        exclusionEndTime: {
            selector: '//input[@name="exclusion_end_time"]',
            locateStrategy: 'xpath'
        },
        addExclusionBtn: {
          selector: 'a.add-exclusion'
        },
        saveCalendarBtn: {
            selector: '#calendar_form_save'
        },
        confirmCalendarBtn: {
            selector: '//button[@id="%s"]',
            locateStrategy: 'xpath'
        },
        editRemoveCalendarBtn: {
            selector: '//button[@title="%s"]',
            locateStrategy: 'xpath'
        },
        calendarsTableSchedule: {
            selector: '#DataTables_Table_1 > tbody > tr > td:nth-child(4)'
        },
        deleteConfirmCalendarButton: {
            selector: '#remove-calendar-confirm'
        },

        //Visualization
        visualizationTab: {
            selector: '#calendar_btn_tab3'
        },
        searchInputCalendar: {
            selector: '//input[@name="calendars_filter"]',
            locateStrategy: 'xpath'
        },
        calendarActiveInput:{
            selector:'//div[@class="checkbox"]//input[@name="calendars_active"]',
            locateStrategy: 'xpath'
        },
        calendarVisibleCalendarsInput: {
          selector: '//div[@class="checkbox"]//input[@name="all_calendars"]',
          locateStrategy: 'xpath'
        },
        eventDragabble: {
            selector: '//div[contains(text(), "%s")]',
            locateStrategy: 'xpath'
        },
        contactNameLabel: {
            selector: 'label.reservation-field-contact'
        },
        calendarNameLabel: {
            selector: 'label.reservation-field-calendar'
        },
        eventNameLabel: {
            selector: 'label.reservation-field-event'
        },
        viewDetailDay: {
            selector: '//button[contains(text(), "%s")]',
            locateStrategy: 'xpath'
        },
        viewDetailTomorrow: {
            selector: '//button[@class="fc-next-button fc-button fc-button-primary"]',
            locateStrategy: 'xpath'
        },
        createEventTable: {
            selector: '//table//tr[@data-time="%s"]/td[2]',
            locateStrategy: 'xpath'
        },
        reservationDescription: {
            selector: '//*[@id="reservation-add-modal"]//textarea[@name="reservation_description"]',
            locateStrategy: 'xpath'
        },
        reservationSave: {
            selector: '#reservation-add'
        },
        reservationEventDrop: {
            selector: 'a.select2-choice.select2-default'
        },
        reservationEventInput: {
            selector: '//ul[@class="select2-results"]//li/div[starts-with(text(),%s)]',
            locateStrategy: 'xpath'
        },
        closeMsg: {
            selector: '//i[starts-with(@id,"botClose")]',
            locateStrategy: 'xpath'
        },
        filterCalendarInput: {
            selector: '//div[@id="DataTables_Table_1_filter"]//input',
            locateStrategy: 'xpath'
        },
        contactInfoLink: {
            selector: '//a[@class="open-contact-info"]',
            locateStrategy: 'xpath'
        },
        contactInfoBackBtn: {
            selector: '#crm-header-back'
        },
        tableCRM: {
            selector: '//table[@id="table-calls"]//td[contains(text(), "%s")]',
            locateStrategy: 'xpath'
        },
        msgPopups: {
            selector: '#divbigBoxes'
        },
        eventToDrag: {
            selector: '//div[@class="fc-time" and @data-start="%s"]',
            locateStrategy: 'xpath'
        },
        backToCalendar: {
            selector: '#booking-header-back'
        },

    },

    commands: [{
        el: function (elementName, data) {
            const element = this.elements[elementName.slice(1)];
            return util.format(element.selector, data);
        },

        goToCalendarManager: function () {
            return this
                .waitForElementVisible('@menu', 9000, 0, true, function () {}, 'Click to expand menu button')
                .click('@menu')
                .waitForElementVisible('@calendar', 9000, 0, true, function () {}, "Go to the menu 'Calendar Manager'")
                .click('@calendar')
        },

        scrollToTop: function (browser) {

            browser.execute(function () {
                window.scrollTo(0, -document.body.scrollHeight);
            });

            return this;

        },

        returnToScript: function () {
            return this
                .waitForElementVisible('@backToCalendar', 100000, 0, true, function (){}, "Return to the script")
                .click('@backToCalendar');
        },

        goToTab: function(tab)
        {
            let element;
            switch(tab)
            {
                case 'Calendars':
                    element='@calendarTab';
                    break;
                case 'Visualization':
                    element='@visualizationTab';
                    break;
            }

            return this
                .waitForElementVisible(element, 9000, 0, true, function () {}, `Go to the tab ${tab}`)
                .click(element);
        },

        createEvent: function (events){

            for(let i=0;i<events.length;i++)
            {
                this
                    .waitForElementVisible('@addEventBtn', 9000, 0, true, function () {}, "Click to 'Add' new event")
                    .click('@addEventBtn')
                    .waitForElementVisible('@eventNameInput', 9000, 0, true, function () {}, `Add event name to '${events[i].name}' `)
                    .setValue('@eventNameInput', events[i].name)
                    .waitForElementVisible('@eventDescriptionTextArea', 9000, 0, true, function () {}, "Add event description")
                    .setValue('@eventDescriptionTextArea', events[i].description)
                    .waitForElementVisible('@durationEventSpinner', 9000, 0, true, function () {}, `Configure duration of the event to '${events[i].duration}'`)
                    .clearValue('@durationEventSpinner')
                    .setValue('@durationEventSpinner', events[i].duration)
                    .waitForElementVisible('@startTimeEvent', 9000, 0, true, function () {}, `Configure start time to '${events[i].start}'`)
                    .setValue('@startTimeEvent', events[i].start)
                    .waitForElementVisible('@endTimeEvent', 9000, 0, true, function () {}, `Configure end time to '${events[i].end}'`)
                    .setValue('@endTimeEvent', events[i].end)
                    .waitForElementVisible('@preEventSpinner', 9000, 0, true, function () {}, `Configure pre-event time to '${events[i].pre}'`)
                    .clearValue('@preEventSpinner')
                    .setValue('@preEventSpinner', events[i].pre)
                    .waitForElementVisible('@postEventSpinner', 9000, 0, true, function () {}, `Configure post-event time to '${events[i].post}'`)
                    .clearValue('@postEventSpinner')
                    .setValue('@postEventSpinner', events[i].post)
                    .waitForElementVisible('@colorBtn', 9000, 0, true, function () {}, `Click to choose color ${events[i].color}`)
                    .click('@colorBtn')
                    .useXpath()
                    .click(this.el('@pickColor', events[i].color));

                if(!events[i].concurrent)
                {
                    this
                        .useXpath()
                        .waitForElementPresent(this.el('@allowConcurrentBooking','Allow concurrent bookings'), 9000, 0, true, function () {}, `Configure concurrent bookings with value '${events[i].concurrent}'`)
                        .click(this.el('@allowConcurrentBooking','Allow concurrent bookings'));
                }

                    this
                        .save('event', 'create');
            }

            return this;


        },

        createCalendar: function(browser,calendars)
        {
            for(let i=0;i<calendars.length;i++)
            {
                this
                    .goToTab('Calendars')
                    .waitForElementVisible('@addCalendarBtn', 9000, 0, true, function () {}, "Click to 'Add' new calendar")
                    .click('@addCalendarBtn')
                    .waitForElementVisible('@calendarNameInput', 9000, 0, true, function () {}, `Add calendar name to '${calendars[i].name}'`)
                    .setValue('@calendarNameInput', calendars[i].name)
                    .waitForElementVisible('@calendarRefInput', 9000, 0, true, function () {}, `Add calendar ref to '${calendars[i].ref}'`)
                    .setValue('@calendarRefInput', calendars[i].ref)
                    .addTemporalExclusions('12:00','14:00')
                    .waitForElementVisible('@calendarStartInput', 9000, 0, true, function () {}, `Configure start time to '${calendars[i].start}'`)
                    .setValue('@calendarStartInput', calendars[i].start)
                    .waitForElementVisible('@calendarEndInput', 9000, 0, true, function () {}, `Configure end time to '${calendars[i].end}'`)
                    .setValue('@calendarEndInput', calendars[i].end);

                if(calendars[i].events.length > 0)
                {
                    this
                        .pause(1000)
                        .associateEventsToCalendar(browser,calendars[i].events);
                }

                this
                    .save('calendar', 'create')
                    .scrollToTop(browser);
            }

            return this;

        },

        associateEventsToCalendar: function(browser, events) {

            for(let j=0;j<events.length;j++)
            {
                this
                    .setValue('@calendarEventsInput', [events[j], browser.Keys.ENTER])
                    .pause(1000)
            }

            return this;
        },

        addTemporalExclusions: function(start,end){
            const now = moment();
            const day  = now.format('dddd');
            const dayElement = `exclusion_day_${day}`;

            return this
                .waitForElementVisible('@temporalExclusions', 9000, 0, true, function () {}, "Click to configure 'Temporal exclusions'")
                .click('@temporalExclusions')
                .useXpath()
                .waitForElementVisible(this.el('@weekDay', dayElement.toLowerCase()), 9000, 0, true, function () {}, `Choose week day ${day} `)
                .click(this.el('@weekDay', dayElement.toLowerCase()))
                .waitForElementVisible('@exclusionStartTime', 9000, 0, true, function () {}, "Click to configure exclusions start time")
                .setValue('@exclusionStartTime', start)
                .waitForElementVisible('@exclusionEndTime', 9000, 0, true, function () {}, "Click to configure exclusions end time")
                .setValue('@exclusionEndTime', end)
                .click('@addExclusionBtn');
        },

        selectCalendarsToVisualize: function(calendars)
        {

          for(let i=0;i<calendars.length;i++)
          {
              this
                  .click('@calendarVisibleCalendarsInput')
                  .waitForElementVisible('@searchInputCalendar', 9000, 0, true, function () {}, `Search for calendar '${calendars[i].name}'`)
                  .setValue('@searchInputCalendar', calendars[i].name)
                  .click('@calendarActiveInput')
                  .clearValue('@searchInputCalendar')
                  .pause(1000);
          }

          return this;

        },

        selectEventFromCalendar: function (calendar, contact){
          return this
              .useXpath()
              .waitForElementVisible(this.el('@eventDragabble', contact.contact), 9000, 0, true, function () {}, `Select the event '${contact.contact}'`)
              .click(this.el('@eventDragabble', contact.contact))
              .checkValues('@contactNameLabel', contact.contact, "contact name")
              .checkValues('@calendarNameLabel', calendar.name, "calendar name")
              .checkValues('@eventNameLabel', calendar.events[0], "event name")

        },

        checkValues: function (element, data, field){
          return this
              .assert.containsText(element, data, `Check if ${field} is '${data}'`);
        },

        save: function (type, option) {
            let btn, confirm, idBtn;

            switch(type){
                case 'event':
                    btn='@saveEventBtn';
                    confirm='@confirmEventBtn';
                    idBtn= "btn btn-primary save-event-confirm-btn";
                    break;
                case 'calendar':
                    btn='@saveCalendarBtn';
                    confirm ='@confirmCalendarBtn';
                    option === 'create' ? idBtn='add-calendar-confirm' : idBtn = 'edit-calendar-confirm';
                    break;
                case 'reservation':
                    btn='@reservationSave';
                    break;
            }

             this
                .waitForElementVisible(btn, 9000, 0, true, function () {}, `Click to save ${type}`)
                .click(btn);

            if(confirm)
            {
                this
                    .waitForElementVisible(this.el(confirm, idBtn), 9000, 0, true, function () {}, `Confirm ${type} creation`)
                    .click(this.el(confirm, idBtn));
            }

            this
                .click('@closeMsg');

            return this;

        },

        msgPopup: function (expectedText, message) {
            return this
                .waitForElementVisible('@msgPopups', 8000, 0, true, function () {}, "Waiting for popup confirmation")
                .assert.containsText('@msgPopups', expectedText, message);
        },

        dragAndDrop: function ( selectorDrag, selectorDrop, browser) {

            browser
                .useXpath()
                .moveToElement(selectorDrag, 0, 0)
                .mouseButtonDown(0)
                .moveToElement(selectorDrop, 0, 0)
                .mouseButtonUp(0);

            return this;
        },

        createReservationInCalendar: function (browser, reservation, isValid=true) {

            this
                .waitForElementVisible(this.el('@viewDetailDay','day'), 9000, 0, true, function () {}, `Click in 'day' view`)
                .click(this.el('@viewDetailDay','day'))
                .waitForElementVisible('@viewDetailTomorrow', 9000, 0, true, function () {}, `Click in 'tomorrow' view`)
                .click('@viewDetailTomorrow');

                if(isValid)
                {

                    for(let i=0;i<reservation.length;i++)
                    {
                        this
                            .click(this.el('@createEventTable', reservation[i].hour))
                            .pause(1000)
                            .click('@reservationEventDrop')
                            .waitForElementVisible(this.el('@reservationEventInput',reservation[i].event), 9000, 0, true, function () {}, `Choose event`)
                            .click(this.el("@reservationEventInput",reservation[i].event))
                            .waitForElementVisible('@reservationDescription', 9000, 0, true, function () {}, `Set reservation description`)
                            .setValue('@reservationDescription', reservation[i].description)
                            .save('reservation')
                            .pause(1000);
                    }

                }
                else
                {
                    this
                        .click(this.el('@createEventTable',reservation[0].hour))
                        .pause(1000)
                        .msgPopup("Error\nWithout available events for booking in the chosen schedule.", "Without available events for booking in the chosen schedule");
                }

                return this;

        },

        search: function(type, name) {


            let el;
            switch(type) {
                case 'event':
                   el = '@filterEventInput';
                   break;
                case 'calendar':
                    this.goToTab('Calendars');
                    el = '@filterCalendarInput';
                    break;
            }

            return this
                .waitForElementVisible(el, 9000, 0, true, function () {}, `Search for ${type} ${name}`)
                .clearValue(el)
                .setValue(el, name);

        },

        edit: function (event, type) {

            let edit,editTitle,assertElement,assertData;
            switch(type){
                case 'event':
                    edit = '@editRemoveEventBtn';
                    editTitle = 'Event edit';
                    assertElement = '@eventsTableDuration';
                    assertData = `00:${(event.duration + 10)}`;
                    break;
                case 'calendar':
                    edit = '@editRemoveCalendarBtn';
                    editTitle = 'Edit';
                    assertElement = '@calendarsTableSchedule';
                    assertData = `${event.start} - ${moment(event.end, "HH:mm").add(2, 'hours').format("HH:mm")}`;
                    break;
            }

            this
                .search(type,event.name)
                .useXpath()
                .waitForElementVisible(this.el(edit, editTitle), 9000, 0, true, function () {}, `Click to edit event ${event.name}`)
                .click(this.el(edit, editTitle));

            if(type === 'event')
            {
                this
                    .waitForElementVisible('@durationEventSpinner', 9000, 0, true, function () {}, `Configure duration of the event to '${event.duration}'`)
                    .clearValue('@durationEventSpinner')
                    .setValue('@durationEventSpinner', event.duration + 10)
            }
            else
            {
                this
                    .waitForElementVisible('@calendarStartInput', 9000, 0, true, function () {}, `Configure start time to '${event.start}'`)
                    .clearValue('@calendarStartInput')
                    .setValue('@calendarStartInput', event.start)
                    .waitForElementVisible('@calendarEndInput', 9000, 0, true, function () {}, `Configure end time to '${event.end}'`)
                    .clearValue('@calendarEndInput')
                    .setValue('@calendarEndInput', moment(event.end, "HH:mm").add(2, 'hours').format("HH:mm"))
            }

            return this
                .save(type, 'edit')
                .search(type,event.name)
                .assert.containsText(assertElement, assertData, `Check if ${type} ${event.name} has been updated`);

        },

        delete: function (event, type) {

            let btnEditRemove,btnTitle,confirm,tableId;

            switch(type)
            {
                case 'event':
                    btnEditRemove = '@editRemoveEventBtn';
                    btnTitle = 'Event remove';
                    confirm = '@eventConfirmDeleteBtn';
                    tableId = 'DataTables_Table_0';
                    break;
                case 'calendar':
                    btnEditRemove = '@editRemoveCalendarBtn';
                    btnTitle = 'Delete';
                    confirm = '@deleteConfirmCalendarButton';
                    tableId = 'DataTables_Table_1';
                    break;

            }

            return this
                .search(type,event.name)
                .useXpath()
                .waitForElementVisible(this.el(btnEditRemove, btnTitle), 9000, 0, true, function () {}, `Click to remove ${type} ${event.name}`)
                .click(this.el(btnEditRemove, btnTitle))
                .waitForElementVisible(confirm, 9000, 0, true, function () {}, `Click to confirm`)
                .click(confirm)
                .search(type, event.name)
                .assert.containsText(this.el('@tableNoData', tableId), 'No data available in table', `Check if ${type} ${event.name} has been deleted`);

        },

        goToCRMView: function (contact) {
            return this
                .waitForElementVisible('@contactInfoLink', 9000, 0, true, function () {}, `Click to see 'Contact Info'`)
                .click('@contactInfoLink')
                .waitForElementPresent(this.el('@tableCRM',contact.first_phone), 9000, 0, true, function () {}, `Check if first phone of contact info is '${contact.first_phone}'`)
                .click(this.el('@tableCRM',contact.first_phone))
                .pause(2000)
                .waitForElementVisible('@contactInfoBackBtn', 9000, 0, true, function () {}, `Return to reservation`)
                .click('@contactInfoBackBtn');
        }

    }]
};