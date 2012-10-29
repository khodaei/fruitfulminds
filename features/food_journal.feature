Feature: add food journal results

  As an ambassador
  So that I can see student's progress to see if they are improving
  I want to add a food journal

Background: results are to be added to database

  Given the following users exist:
    | email              | password | name         | type | school_id |
    | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |     1     |

  Given the following schools exist:
    | name | county | city | 
    | "school1" | "Alameda" | "Berkeley" |

  Given the following school_infos exist:
    | school_id | semester | year |
    |     1     |   Fall   | 2011 |

  And   I am logged in as amir
  And   I am on the portal page

Scenario: add new post-results to database
  When  I follow "Add Food Journal"
  Then  I should be on the Add New Food Journal page
  And   I fill in "food_journal_week_num" with "7"
  And   I fill in "food_journal_student_name" with "A Student"
  And   I fill in "food_journal_fruit" with "7"
  And   I fill in "food_journal_vegetable" with "37"
  And   I fill in "food_journal_sugary_drink" with "73"
  And   I fill in "food_journal_water" with "87"
  And   I press "Add More Results"
  Then  I should see "Results successfully added."
