Feature: user logs into his/her portal

  As a user
  So that I can access the appropriate portal
  I want to login in with my username and password

Background: users have been added to database

  Given the following users exist:
  | email              | password | name         | type | school_id |
  | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |     1     |

  Given the following schools exist:
    | name    | county  | city     |
    | school1 | Alameda | Berkeley |

  And I am on the login page

Scenario: ambassador/administrator logs in
  Given I fill in "Email" with "amirk88@gmail.com"
  And I fill in "Pass" with "123f5"
  And I press "Sign In"
  Then I should be on the portal page
  And I should see "Add Pre-Survey Part 1 Results"
  And I should see "Add Pre-Survey Part 2 Results"
  And I should see "Add Post-Survey Results"
  And I should see "Preview Report/Add Ambassador Comments"

Scenario: ambassador logs out
  Given I fill in "Email" with "amirk88@gmail.com"
  And I fill in "Pass" with "123f5"
  And I press "Sign In"
  And I am on the portal page
  And I follow "log_out"
  Then I should be on the login page

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
