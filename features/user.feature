Feature: user

  In order to manage my account
  As a visitor becoming or being a user
  I want to be able to confirm my account

  Scenario: passive user confirms account
    Given I am a passive user
    When I request confirmation instructions
    And I visit the confirmation page
    And I confirm my account
    Then I should be an active user
