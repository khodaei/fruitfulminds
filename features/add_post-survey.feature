Feature: add pre survey results

  As an ambassador
  So that I can generate reports
  I want to have the data in a easy to access location

Background: results have been added to database

  Given the following results exist:
  | title                   | rating | release_date |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And  I am on the RottenPotatoes home page

Scenario: create a new movie
  When  I follow "Add new movie"
  Then  I should be on the Create New Movie page
  And   I fill in "Title" with "New Movie"
  And   I fill in "Director" with "New Director"
  And   I press "Save Changes"
  Then  I should see "New Movie was successfully created."
