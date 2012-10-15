Feature: Generate a Textual Report

  As an Ambassador
  So that I can determine the Strengths and Weaknesses of the lessons in
  the curriculum taught
  I want to generate a textual report based on the results of pre/post
  surveys and the Ambassador's feedback

Background: Generate report based on survey results

  Given the following users exist:
    | email              | password | name         | type |
    | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |

  Given the following schools exist:
    | name    | state | county  | district |
    | school1 | CA    | Alameda | Berkeley |
    | school2 | CA    | Rowland | Rowland  |

  Given the following pre-results exist:
    | school_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |     2     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |
  Given the following post-results exist:
    | school_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2 |

  And   I am logged in
  And   I am on the generate report page

Scenario: Generate Report
  Given I select "school1" from "school"
  And I press "Generate Report"
  Then I should be on the portal page
  And I should see "Report generated successfully for school1"

Scenario: Generate Report Failure
  Given I select "school2" from "school"
  And I press "Generate Report"
  Then I should be on the generate report page
  And I should see "school2 does not have pre/post surveys"
