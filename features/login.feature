Feature: user logs into his/her portal

  As a user
  So that I can access the appropriate portal
  I want to login in with my username and password

Background: users have been added to database

  Given the following users exist:
  | email              | password | name         | type |
  | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |
  | felix1@gmail.com   | 342adsf  | felix wong   | 2    |

  And I am on the FruitfulMinds homepage

Scenario: ambassador logs in
  Given I enter "amirk88" as my username
  And I enter "12345" as my password
  And I press "Login"
  Then I should be on "Ambassador Portal"
  And I should see "Add Survey Results"
  And I should see "Generate Report"

Scenario: administrator logs in
  Given I enter "felix1" as my username
  And I enter "342adsf" as my password
  And I press "Login"
  Then I should be on "Administrator Protal"
  And I should see "Add Survey Results"
  And I should see "Generate Report"

Scenario: user does not exists
  Given I enter "someone" as my username
  And I enter "2442j3" as my password
  And I press "Login"
  Then I should be on homepage
  And I should see "user does not exist"
