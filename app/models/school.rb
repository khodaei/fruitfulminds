class School < ActiveRecord::Base
  has_many :presurveys
  has_many :postsurveys
end