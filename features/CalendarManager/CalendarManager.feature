  @calendar
  Feature: Calendar Manager

    @release
    Scenario: Create Events

      Given I open GoContact page
      Then the go to the tab Calendar Manager
      And I create an event
      |name           | description             | duration | color | start | end   | pre | post | concurrent |
      | ATEvent_001   | ATEventDescription_001  | 30       | Pink  | 09:00 | 18:00 | 0   |0     |  true      |

    Scenario: Edit Events

      Given I open GoContact page
      Then the go to the tab Calendar Manager
      And I edit an event
        |Name           | Description             | Duration | Color | Start | End   | Pre | Post | Concurrent |
        | ATEvent_001   | ATEventDescription_001  | 30       | Pink  | 09:00 | 18:00 | 0   |0     |  true      |

    Scenario: Delete Events

      Given I open GoContact page
      Then the go to the tab Calendar Manager
      And I delete an event
        |Name           | Description             | Duration | Color | Start | End   | Pre | Post | Concurrent |
        | ATEvent_001   | ATEventDescription_001  | 30       | Pink  | 09:00 | 18:00 | 0   |0     |  true      |