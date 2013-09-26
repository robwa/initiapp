Feature: new user creates initiative

  As a new user
  I want to create an initiative
  In order to collaborate with others

  Scenario: create initiative
    Given I visit the initiatives site
    When I submit the desired name of the new initiative
    Then I see the homepage of the new initiative
