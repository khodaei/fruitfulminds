# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!({:name => "test account", :email => "user@fruitfulminds.org", :password => "password", :type => 1, :school_id => 1})
School.create!({:name => 'school name', :county => 'county', :city => 'city'})
School.create!({:name => 'another school', :county => 'another county', :city => 'another city'})
SchoolInfo.create!({:school_id => 1, :semester => "Fall", :year => 2012})
