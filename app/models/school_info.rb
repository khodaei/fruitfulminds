class SchoolInfo < ActiveRecord::Base
  belongs_to :school
  has_many :presurveys
  has_many :postsurveys
  has_many :food_journals
end
