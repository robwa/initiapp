Feature: show topic

  In order to follow a communication
  as an active user
  I want to see all posts of a topic

  Scenario: visit topic page
    Given an initiative
    And I am a member of the initiative
    And a topic
    When I visit the initiative homepage
    And I choose the topic
    Then I see a page with all texts regarding the topic
