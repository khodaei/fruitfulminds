class School < ActiveRecord::Base
  has_many :presurveys
  has_many :postsurveys
  has_many :reports
  has_many :school_infos
  has_many :users
  has_many :reports
end
