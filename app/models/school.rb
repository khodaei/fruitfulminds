class School < ActiveRecord::Base
  has_many :presurveys, :through => :survey_info
  has_many :postsurveys, :through => :survey_info
  has_many :school_info
  has_one :report
end
