Feature: Generate a Report Summary

  As an Ambassador
  So that I can verify the correctness of report and add comments to it
  I want to view a summary of the report and add comments before generating a pdf version of the report

Background: Generate report based on survey results

  Given the following users exist:
    | email              | password | name         | type | school_id |
    | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |     1     |
    | john@gmail.com     | 12345    | john khodaei | 1    |     2     |

  And the following schools exist:
    | name    | county  | city     |
    | school1 | Alameda | Berkeley |
    | school2 | Rowland | Rowland  |

  And the following pre-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    6    |     5     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |

  And the following post-results exist:
    | user_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 5  | 3  | 4  | 2  | 7  | 4  | 4  | 8  | 5  | 5  | 8  | 9  | 10  | 5  | 2 |
    |    3    |     3     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2 |

  And the following school_infos exist:
    | school_id | semester | year |
    |     1     |   Fall   | 2011 |

  And I am logged in as amir
  And I am on the generate report page

Scenario: add ambassador note to a report
  Given I select "school1" from "school"
  And I press "Generate Report"
  And I fill "Ambassador Note" with "some comments to explain the report being generated"
  And I press "Add Note"
  Then I should be on the generate report page
  And I should see "some comments to explain the report being generated"
  And I should not see "Add Note"
  And I should see "Generate pdf"
