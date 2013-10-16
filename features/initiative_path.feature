Feature: initiative path

  In order to be recognized by humans and search engines
  As any user
  I want to get nicely named project paths

  Scenario: visit initiative homepage
    Given an initiative named "Test Initiative"
    When I visit the initiative homepage
    Then the homepage path is "/test-initiative"

  Scenario: create initiative with existing name
    Given an initiative with a name
    When I create an initiative with the same name
    Then a suffix is added to the homepage path
