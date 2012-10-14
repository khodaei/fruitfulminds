Feature: add pre-survey results

  As an ambassador
  So that I can generate pre-survey reports
  I want to have the data in an easy to access location

Background: results are to be added to database

  Given the following pre-results exist:
    | school_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |     4     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |     8     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |
    |     9     | 3  | 2  | 2  | 2  | 2  | 6  | 4  | 6  | 8  | 5  | 6  | 9  | 3  | 1  | 5  | 2   |

  And   I am on the home page

Scenario: add new pre-results to database
  When  I follow "Add new pre-survey"
  Then  I should be on the Add new pre-survey results page
  And   I fill in "Section 1" with "7"
  And   I fill in "Section 2" with "7"
  And   I fill in "Section 3" with "7"
  And   I fill in "Section 4" with "7"
  And   I fill in "Section 5" with "7"
  And   I fill in "Section 6" with "7"
  And   I fill in "Efficacy 1" with "7"
  And   I fill in "Efficacy 2" with "7"
  And   I fill in "Efficacy 3" with "7"
  And   I fill in "Efficacy 4" with "7"
  And   I fill in "Efficacy 5" with "7"
  And   I fill in "Efficacy 6" with "7"
  And   I fill in "Efficacy 7" with "7"
  And   I fill in "Efficacy 8" with "7"
  And   I fill in "Efficacy 9" with "7"
  And   I fill in "Efficacy 1" with "7"
  And   I fill in "Efficacy 10" with "7"
  And   I press "Save Changes"
  Then  I should see "Results successfully added."
