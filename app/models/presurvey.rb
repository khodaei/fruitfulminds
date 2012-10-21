class Presurvey < ActiveRecord::Base
  belongs_to :school
  validates_numericality_of :section_1, :section_2, :section_3, :section_4, :section_5, :section_6, :efficacy_1, :efficacy_2, :efficacy_3, :efficacy_4, :efficacy_5, :efficacy_6, :efficacy_7, :efficacy_8, :efficacy_9, :efficacy_10
end
