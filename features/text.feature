Feature: text

  In order to participate in an initiative
  As a signed in member of the initiative
  I want to be able to write a text regarding the initiative

  @wip
  Scenario: write a text
    Given an initiative
    And a signed in user
    When I visit the initiative homepage
    And I enter the text "My special Text." with the title "Test Title"
    Then the text "My special Text." with the title "Test Title" is shown on the page
