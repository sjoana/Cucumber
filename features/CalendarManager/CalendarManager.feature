@calendar
Feature: Calendar Manager

  @release
  Scenario: Create Events

    Given I open GoContact page
    Then the go to the tab Calendar Manager
    And I "create" an event

  @release
  Scenario: Edit Events

    Given I open GoContact page
    Then the go to the tab Calendar Manager
    And I "edit" an event

  @release
  Scenario: Delete Events

    Given I open GoContact page
    Then the go to the tab Calendar Manager
    And I "delete" an event