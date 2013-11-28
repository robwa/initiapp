Feature: passive

  In order to prevent abusing email addresses
  As a passive user or an anonymous user becoming a passive user
  I want to receive notifications for each action

  Scenario: an anonymous user creates an initiative
    Given an initiative
    And I am an anonymous user
    When I join the initiative
    Then I should be a passive user
    And I receive an email confirming the creation of the initiative

  Scenario: a passive user creates an initiative
    Given an initiative
    And I am a passive user
    When I join the initiative
    Then I receive an email confirming the creation of the initiative

  Scenario: an active user creates an initiative
    Given an initiative
    And I am an active user
    When I join the initiative
    Then I should receive no email
