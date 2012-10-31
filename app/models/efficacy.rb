class Efficacy < ActiveRecord::Base
  belongs_to :postsurvey
  validates_presence_of :survey_id

end
