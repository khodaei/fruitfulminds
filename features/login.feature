Feature: user logs into his/her portal

  As a user
  So that I can access the appropriate portal
  I want to login in with my username and password

Background: users have been added to database

  Given the following users exist:
  | email              | password | name         | type |
  | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |

  And I am on the login page

Scenario: ambassador/administrator logs in
  Given I fill in "Email" with "amirk88@gmail.com"
  And I fill in "Pass" with "123f5"
  And I press "Sign In"
  Then I should be on the portal page
  And I should see "Add Pre-Survey Results"
  And I should see "Add Post-Survey Results"
  And I should see "Generate Report"

# Scenario: administrator logs in

Scenario: Incorrect password is entered
  Given I fill in "Email" with "amirk88@gmail.com"
  And I fill in "Pass" with "password"
  And I press "Sign In"
  Then I should be on the login page
  And I should see "Incorrect password! Please try again."

Scenario: Incorrect username is entered
  Given I fill in "Email" with "felix@wong.com"
  And I fill in "Pass" with "password"
  And I press "Sign In"
  Then I should be on the login page
  And I should see "Incorrect email/password! Please try again."
