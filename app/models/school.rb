class School < ActiveRecord::Base
  has_many :school_semesters
  has_many :users, :through => :school_semesters
  has_many :presurvey1s, :through => :school_semesters
  has_many :presurvey2s, :through => :school_semesters
  has_many :postsurveys, :through => :school_semesters
  has_many :reports #, :through => :surveys
end
