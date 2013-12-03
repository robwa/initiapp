Feature: create topic

  In order to participate in an initiative
  As any user
  I want to be able to write a text regarding the initiative

  Scenario: write a text as a member
    Given an initiative
    And I am an active member of the initiative
    When I visit the initiative homepage
    And I enter the text "My special Text." with the title "Test Title"
    Then the text "My special Text." with the title "Test Title" is shown on the page

  Scenario: write a text as a passive member
    Given an initiative
    And I am a passive member of the initiative
    When I visit the initiative homepage
    And I enter my email address
    And I enter a text with a title
    Then I see a notice, that my text has been saved

  Scenario: write a text as an active user
    Given an initiative
    And I am an active user
    When I visit the initiative homepage
    And I enter a text with a title
    Then I see a notice, that my text has been saved

  Scenario: write a text as a passive user
    Given an initiative
    And I am a passive user
    When I visit the initiative homepage
    And I enter my email address
    And I enter a text with a title
    Then I see a notice, that my text has been saved

  Scenario: write a text as an anonymous user
    Given an initiative
    When I visit the initiative homepage
    And I enter my email address
    And I enter a text with a title
    Then I see a notice, that my text has been saved


  Scenario: receive notification for text
    Given an initiative with several members
    When I visit the initiative homepage
    And I enter my email address
    And I enter a text with a title
    Then each member of the initiative receives an email

  Scenario: receive notification for text as a member
    Given an initiative with several members
    And I am a member of the initiative as well
    When I visit the initiative homepage
    And I enter a text with a title
    Then each member of the initiative except me receives an email
    
