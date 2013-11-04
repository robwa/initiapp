Feature: initiatives

  In order to collaborate with others
  As an anonymous or known visitor
  I want to create and join initiatives

  Scenario: create initiative
    When I visit the initiatives website
    And I submit "Test Initiative" as the name of the new initiative
    Then I see the homepage of "Test Initiative"

  Scenario: create initiative with existing name
    Given an initiative with a name
    When I create an initiative with the same name
    Then a suffix is added to the homepage path

  Scenario: visit initiative
    Given a number of initiatives
    When I visit the initiatives website
    And I choose the initiative "Interesting Initiative" from the list
    Then I see the homepage of "Interesting Initiative"

  Scenario Outline: initiative homepage path
    Given an initiative named "<name>"
    When I visit the initiative homepage
    Then the homepage path is "<path>"

  Scenarios: valid names and paths
    | name            | path             |
    | Test Initiative | /test-initiative |
    | zuckersüß       | /zuckersuess     |
    | Ähre            | /aehre           |
    | Einfach machen! | /einfach-machen  |
    | !               | /1               |
    | !+/&            | /1               |
    | 8teen           | /8teen           |
    | under_score     | /under_score     |
    | ruby.rails      | /ruby-rails      |
    | about:source    | /about-source    |
  

  Scenario: join initiative as an anonymous user
    Given an initiative
    When I join the initiative
    Then I should be signed in
    And I see myself in the members list
    And "some@address.email" should receive an email

  @wip
  Scenario: join initiative as a known user
    Given an initiative "Test Initiative"
    And an initiative "Other Initiative"
    And a user "user@test.net"
    When I sign in joining "Test Initiative"
    And I join "Other Initiative"
    Then I see myself in the members list
