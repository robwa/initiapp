@wip
Feature: known visitor

  As a known visitor
  I want to be able to join initiatives,
  receive emails and confirm my account
  In order to become a full qualified user

  Scenario: join initiative
    Given an initiative and a user
    When I sign in
    And I join the initiative
    Then I see myself in the members list
