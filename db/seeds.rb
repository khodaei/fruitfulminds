# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Profile.create!(:label => "admin")
Profile.create!(:label => "ambassador")

User.create!({:name => "fm account", :email => "user@fruitfulminds.org", :password => "password", :school_semester_id => 1, :profile_id => 1})
User.create!({:name => "test account", :email => "admin@fruitfulminds.org", :password => "password", :school_semester_id => 1, :profile_id => 1})
User.create!({:name => "ambassador", :email => "amb@fruitfulminds.org", :password => "password", :school_semester_id => 1, :profile_id => 2})

School.create!({:name => 'school name', :county => 'county', :city => 'city'})
School.create!({:name => 'another school', :county => 'another county', :city => 'another city'})
School.create!({:name => 'BAM', :county => 'Alameda', :city => 'Berkeley'})

SchoolSemester.create!({:school_id => 1, :name => "Fall", :year => 2012})

StaticContent.create!({
                   :intro_title => "Intro to Fruitful Minds",
                   :introduction => "Fruitful Minds is a start up, non-profit organization providing nutrition education to youth at greatest risk for obesity and related illnesses.  The program recruits young people with a passion for health and education from local colleges and universities like UC Berkeley to develop curriculum and instruct children through classroom presentation, after school sports programs and summer camps.  While many nutrition programs exist today, Fruitful Minds is unique in its targeting of at-risk youth, customized approach and use of college students to deliver the program.  Fruitful Minds goal is to identify elementary schools, middle schools, and community centers where a nutrition education component is lacking and partner with existing sports, cooking or gardening programs to form a complete education focused on ending the escalating rate of obesity among at-risk youth.",
                   :objectives_title => "Fruitful Minds 7-Week Lesson Objectives",
                   :strength_weakness_intro => "Based on the pre- and post-curriculum surveys, as well as feedback from the ambassadors, we identified areas of strength and weaknesses. Below is a list of strengths and weaknesses of the class series:",
                   :strength_intro => "Strengths:",
                   :weakness_intro => "Weaknesses:",
                   :eval_title => "Curriculum Evaluations",
                   :summary => "Based on our evaluation, we plan to spend more time developing the concepts that proved to be incompletely understood at the completion of the lesson series, and include more in-class activities that reinforce these learning objectives."
                  })
