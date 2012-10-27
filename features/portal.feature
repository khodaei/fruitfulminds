Feature: edit existing pre-survey results

  As an ambassador
  So that I can edit pre-survey reports
  I want to have the data in an easy to access location

Background: results are to be added to database

  Given the following users exist:
    | email              | password | name         | type | school_id |
    | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |     1     |

  Given the following pre-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    4    |     4     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    2    |     8     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |
    |    4    |     9     | 3  | 2  | 2  | 2  | 2  | 6  | 4  | 6  | 8  | 5  | 6  | 9  | 3  | 1  | 5  | 2   |

  Given the following post-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    4    |     4     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    2    |     8     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |
    |    4    |     9     | 3  | 2  | 2  | 2  | 2  | 6  | 4  | 6  | 8  | 5  | 6  | 9  | 3  | 1  | 5  | 2   |

  Given the following schools exist:
    | name | county | city | 
    | "school1" | "Alameda" | "Berkeley" |
    
  Given the following school_infos exist:
    | school_id | semester | year |
    |     1     |   Fall   | 2011 |

  And   I am logged in as amir
  And   I am on the portal page

Scenario: edit existing pre-results to database
  When  I press "edit_presurvey_1"
  Then  I should be on the Edit Pre-Survey Results (Part 1) page
  And   I fill in "presurvey_section_1" with "7"
  And   I fill in "presurvey_section_2" with "7"
  And   I fill in "presurvey_section_3" with "7"
  And   I fill in "presurvey_section_4" with "7"
  And   I fill in "presurvey_section_5" with "7"
  And   I fill in "presurvey_section_6" with "7"
  And   I fill in "presurvey_efficacy_1" with "7"
  And   I fill in "presurvey_efficacy_2" with "7"
  And   I fill in "presurvey_efficacy_3" with "7"
  And   I fill in "presurvey_efficacy_4" with "7"
  And   I fill in "presurvey_efficacy_5" with "7"
  And   I fill in "presurvey_efficacy_6" with "7"
  And   I fill in "presurvey_efficacy_7" with "7"
  And   I fill in "presurvey_efficacy_8" with "7"
  And   I fill in "presurvey_efficacy_9" with "7"
  And   I fill in "presurvey_efficacy_10" with "7"
  And   I press "Save Changes"
  Then  I should see "Survey updated successfully."
