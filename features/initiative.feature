Feature: initiative

  In order to collaborate with others
  As an anonymous or known visitor
  I want to create and join initiatives

  Scenario: create initiative
    When I visit the initiatives website
    And I create an initiative
    Then I see the homepage of the initiative

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
    Given an initiative
    When I join the initiative as "some@address.email"
    Then I am not signed in
    But "some@address.email" is a member of the initiative
    And "some@address.email" should receive an email

  Scenario: join initiative as an active user
    Given an initiative
    And I am an active user
    When I join the initiative
    Then I see myself in the members list

  Scenario: join initiative as a signed out active user
    Given an initiative
    And I am a signed out active user
    When I join the initiative
    Then I am not signed in
