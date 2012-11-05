Feature: Generate a Report Summary

  As an Ambassador
  So that I can verify the correctness of report and add comments to it
  I want to view a summary of the report and add comments before generating a pdf version of the report

Background: Generate report based on survey results

  Given the following users exist:
    | email              | password | name         | type | school_semester_id |
    | amirk88@gmail.com  | 123f5    | amir khodaei | 1    |     1     |
    | john@gmail.com     | 12345    | john khodaei | 1    |     2     |

  And the following schools exist:
    | name    | county  | city     |
    | school1 | Alameda | Berkeley |
    | school2 | Rowland | Rowland  |
    

  Given the following pre-results 1 exist:
    | school_semester_id | section_1_1 | section_1_2 | section_2_1 | section_2_2 | section_2_3 | section_2_4 | section_3_1 | section_3_2 | section_3_3 | section_3_4 | section_3_5 | section_3_6 | section_4_1 | section_4_2 | section_4_3 | 
    |    1    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 
    
  Given the following pre-results 2 exist:
    | school_semester_id | section_4_1 | section_4_2 | section_5_1 | section_5_2 | section_5_3 | section_5_4 | 
    |    1    |     1     | 3  | 3  | 2  | 4  | 2  |

  Given the following post-results exist:
    | school_semester_id | section_1_1 | section_1_2 | section_2_1 | section_2_2 | section_2_3 | section_2_4 | section_3_1 | section_3_2 | section_3_3 | section_3_4 | section_3_5 | section_3_6 | section_4_1 | section_4_2 | section_4_3 | section_5_1 | section_5_2 | section_6_1 | section_6_2 | section_6_3 | section_6_4 | number_students |
    |    1    |     1     | 2  | 5  | 3  | 4  | 2  | 7  | 4  | 4  | 8  | 5  | 5  | 8  | 9  | 10  | 5  | 2 |    3    |     3     | 2  | 3  | 9 |
    
  Given the following school_semesters exist:
    | school_id | name | year |
    |     1     |   Fall   | 2011 |

  And I am logged in as amir
  And I am on the generate report page


