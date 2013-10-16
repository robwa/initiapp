Feature: initiative path

  In order to be recognized by humans and search engines
  As any user
  I want to get nicely named project paths

  Scenario: visit initiative homepage
    Given an initiative named "Test Initiative"
    When I visit the initiative homepage
    Then the homepage path is "/test-initiative"
