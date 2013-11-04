Feature: Verify login from index

  Background: Open index page
    Given I open index

  Scenario: Check admin login
    Given I input "admin" into "username"
    And I input "pass" into "password"
    And I click button "登 录"
    Then I should see link "登 出"
