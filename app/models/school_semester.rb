class SchoolSemester < ActiveRecord::Base
  has_many :users
  has_many :presurvey1s
  has_many :presurvey2s
  has_many :postsurveys
  belongs_to :school
end
