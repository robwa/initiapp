Feature: users

  In order to manage my account
  As a visitor becoming or being a user
  I want to be able to confirm my account

  Scenario: confirm account
    Given a user "user@test.net"
    When I request confirmation instructions
    And I visit the confirmation page
    And I confirm my account
    Then I am a confirmed user
