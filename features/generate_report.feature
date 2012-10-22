Feature: Generate a Textual Report

  As an Ambassador
  So that I can determine the Strengths and Weaknesses of the lessons in
  the curriculum taught
  I want to generate a textual report based on the results of pre/post
  surveys and the Ambassador's feedback

Background: Generate report based on survey results

  Given the following users exist:
    | email              | password | name         | type | school_id |
    | amirk88@gmail.com     | 123f5    | amir khodaei | 1    |     1     |
    | john@gmail.com     | 12345    | john khodaei | 1    |     2     |

  Given the following schools exist:
    | name    | county  | city     |
    | school1 | Alameda | Berkeley |
    | school2 | Rowland | Rowland  |

  Given the following pre-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    6    |     5     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |

  Given the following post-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 5  | 3  | 4  | 2  | 7  | 4  | 4  | 8  | 5  | 5  | 8  | 9  | 10  | 5  | 2 |
    |    3    |     3     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2 |

  Given the following school_infos exist:
    | school_id | semester | year |
    |     1     |   Fall   | 2011 |

Scenario: Generate Report
  Given   I am logged in as amir
  And   I am on the generate report page
  And I select "school1" from "school"
  And I press "Generate Report"
  Then I should be on the portal page
  And I should see "Report generated successfully for school1"

Scenario: Generate Report Failure
  Given   I am logged in as john
  And   I am on the generate report page
  And I select "school2" from "school"
  And I press "Generate Report"
  Then I should be on the generate report page
  And I should see "school2 does not have pre/post surveys"
