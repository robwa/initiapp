Feature: initiative

  In order to collaborate with others
  As an anonymous or known visitor
  I want to create and join initiatives

  Scenario: create initiative
    When I visit the initiatives website
    And I submit "Test Initiative" as the name of the new initiative
    Then I see the homepage of "Test Initiative"

  Scenario: create initiative with existing name
    Given an initiative "test"
    When I create an initiative with the same name
    Then a suffix is added to the homepage path

  Scenario: visit initiative
    Given a number of initiatives
    When I visit the initiatives website
    And I choose the initiative "Interesting Initiative" from the list
    Then I see the homepage of "Interesting Initiative"

  Scenario Outline: initiative homepage path
    Given an initiative "<name>"
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
    Given an initiative "Test Initiative"
    When I sign in as "some@address.email" joining "Test Initiative"
    Then I am signed in as "some@address.email"
    And I see "some@address.email" in the members list
    And "some@address.email" should receive an email

  Scenario: join initiative as a known user
    Given a user "user@test.net"
    And an initiative "Test Initiative"
    And an initiative "Other Initiative"
    When I sign in as "user@test.net" joining "Test Initiative"
    And I join "Other Initiative"
    Then I see "user@test.net" in the members list

  Scenario: join initiative as a confirmed user without password
    Given a confirmed user "user@test.net" with "password"
    And an initiative "Test Initiative"
    When I try to sign in as "user@test.net" joining "Test Initiative"
    Then I am not signed in
