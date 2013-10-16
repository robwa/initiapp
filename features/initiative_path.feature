Feature: initiative path

  In order to be recognized by humans and search engines
  As any user
  I want to get nicely named project paths


  Scenario Outline: visit initiative homepage
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
  

  Scenario: create initiative with existing name
    Given an initiative with a name
    When I create an initiative with the same name
    Then a suffix is added to the homepage path
