Feature: anonymous visitor

  As an anonymous visitor
  I want to create an initiative
  In order to collaborate with others

  Scenario: create initiative
    When I visit the initiatives website
    And I submit "Test Initiative" as the name of the new initiative
    Then I see the homepage of "Test Initiative"
