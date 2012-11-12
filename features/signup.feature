Feature: New user registeration

  As a new user
  So I can view the user portal
  I want to sign up in the website

Background: users have been added to database

  Given the following profiles exist:
    | label      |
    | admin      |
    | ambassador |

  And the following schools exist:
    | name    | county  | city     |
    | school1 | Alameda | Berkeley |

  And the following school_semesters exist:
    | school_id | name | year |
    | 1         | fall | 2012 |

  Scenario: user follows registration page
    Given I am on the login page
    And I follow "Register"
    Then I should be on the signup page

  Scenario: user registers successfully
    Given I am on the signup page
    And I fill in full name, email and passwords with: "New User", "newuser@gmail.com", "password", "password"
    And I check "tos"
    And I press "Register"
    Then I should be on the portal page
    And I should see "Registration completed successfully"

  Scenario: user does not check tos
    Given I am on the signup page
    And I fill in full name, email and passwords with: "New User", "newuser@gmail.com", "password", "password"
    And I press "Register"
    Then I should be on the signup page
    And I should see "You have to accept the TOS in order to register"

  Scenario: passwords entered do not match
    Given I am on the signup page
    And I fill in full name, email and passwords with: "New User", "newuser@gmail.com", "password", "passw"
    And I check "tos"
    And I press "Register"
    Then I should be on the signup page
    And I should see "Passwords did not match"

  Scenario: user leaves a registration field empty
    Given I am on the signup page
    And I fill in email and passwords with: "newuser@gmail.com", "password", "password"
    And I check "tos"
    And I press "Register"
    Then I should be on the signup page
    And I should see "Please fill in all fields"

  Scenario: password too short
    Given I am on the signup page
    And I fill in full name, email and passwords with: "New User", "amir@me.com", "passw", "passw"
    And I check "tos"
    And I press "Register"
    Then I should be on the signup page
    And I should see "Password must have 6 characters or more"
