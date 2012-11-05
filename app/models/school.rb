class School < ActiveRecord::Base
  has_many :school_semesters
  has_many :users, :through => :school_semesters
  has_many :presurvey_part1s, :through => :school_semesters, :class_name => "Presurvey::Part1"
  has_many :presurvey_part2s, :through => :school_semesters, :class_name => "Presurvey::Part2"
  has_many :postsurveys, :through => :school_semesters
  has_many :reports #, :through => :surveys
end
