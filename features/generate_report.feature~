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
    | school_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    6    |     5     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |
    
  Given the following pre-results exist:
    | school_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 3  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2   |
    |    6    |     5     | 8  | 1  | 7  | 7  | 7  | 5  | 4  | 4  | 7  | 6  | 5  | 7  | 9  | 9  | 6  | 3   |

  Given the following post-results exist:
    | school_id | school_info_id | section_1 | section_2 | section_3 | section_4 | section_5 | section_6 | efficacy_1 | efficacy_2 | efficacy_3 | efficacy_4 | efficacy_5 | efficacy_6 | efficacy_7 | efficacy_8 | efficacy_9 | efficacy_10 |
    |    1    |     1     | 2  | 5  | 3  | 4  | 2  | 7  | 4  | 4  | 8  | 5  | 5  | 8  | 9  | 10  | 5  | 2 |
    |    3    |     3     | 2  | 3  | 2  | 4  | 2  | 4  | 4  | 4  | 7  | 5  | 5  | 7  | 9  | 9  | 5  | 2 |

  Given the following school_infos exist:
    | school_id | semester | year |
    |     1     |   Fall   | 2011 |

    
    
  Given the following static content exists:
    | intro_title | introduction | objectives_title | strength_weakness_intro | strength_intro | weakness_intro | eval_title | summary | 
    | Intro to Fruitful Minds |   Fruitful Minds is a start up, non-profit organization providing nutrition education to youth at greatest risk for obesity and related illnesses.  The program recruits young people with a passion for health and education from local colleges and universities like UC Berkeley to develop curriculum and instruct children through classroom presentation, after school sports programs and summer camps.  While many nutrition programs exist today, Fruitful Minds is unique in its targeting of at-risk youth, customized approach and use of college students to deliver the program.  Fruitful Minds goal is to identify elementary schools, middle schools, and community centers where a nutrition education component is lacking and partner with existing sports, cooking or gardening programs to form a complete education focused on ending the escalating rate of obesity among at-risk youth.   | Fruitful Minds 7-Week Lesson Objectives |     Based on the pre- and post-curriculum surveys, as well as feedback from the ambassadors, we identified areas of strength and weaknesses. Below is a list of strengths and weaknesses of the class series:     |   Strengths:   | Weaknesses: |    Curriculum Evaluations     |  Based on our evaluation, we plan to spend more time developing the concepts that proved to be incompletely understood at the completion of the lesson series, and include more in-class activities that reinforce these learning objectives.  | 
    
   

Scenario: Generate Report
  Given I am logged in as amir
  And I am on the generate report page
  And I select "school1" from "school"
  And I press "Generate Report"
  Then I should see "Fruitful Minds school1 Fall 2012 Report"
  And I should see "Intro to Fruitful Minds"
  And I should see "Fruitful Minds at school1"
  And I should see "Fruitful Minds 7-Week Lesson Objectives"
  And I should see "Curriculum Evaluations"
  And I should see "Strengths and Weaknesses of FM Lessons at school1"
  And I should see "Strengths:"
  And I should see "Weaknesses:"
  
    

Scenario: Generate Report Failure
  Given I am logged in as john
  And I am on the generate report page
  And I select "school2" from "school"
  And I press "Generate Report"
  And I should see "school2 does not have Presurvey Part 1 and 2 or Postsurvey"
  And I should not see "Fruitful Minds school1 Fall 2012 Report"
  And I should not see "Intro to Fruitful Minds"
  And I should not see "Fruitful Minds at school1"
  And I should not see "Fruitful Minds 7-Week Lesson Objectives"
  And I should not see "Curriculum Evaluations"
  And I should not see "Strengths and Weaknesses of FM Lessons at school1"
  And I should not see "Strengths:"
  And I should not see "Weaknesses:"
