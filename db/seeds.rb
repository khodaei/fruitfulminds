# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create!({:name => 'school name', :state => 'state', :county => 'county', :district => 'district'})
School.create!({:name => 'another school name', :state => 'another state', :county => 'another county', :district => 'another district'})
