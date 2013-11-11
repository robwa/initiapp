Feature: text

  In order to participate in an initiative
  As any user
  I want to be able to write a text regarding the initiative

  Scenario: write a text as a member
    Given an initiative
    And I am a signed in member of the initiative
    When I visit the initiative homepage
    And I enter the text "My special Text." with the title "Test Title"
    Then the text "My special Text." with the title "Test Title" is shown on the page

  Scenario: write a text as a known user
    Given an initiative
    And I am a signed in user
    When I visit the initiative homepage
    And I enter a text with a title
    Then I see a notice, that my text has been saved

  Scenario: write a text as an anonymous user
    Given an initiative
    When I visit the initiative homepage
    And I enter my email address
    And I enter a text with a title
    Then I see a notice, that my text has been saved
