class Presurvey::Part2 < ActiveRecord::Base
  belongs_to :school_semester
  validates_presence_of :school_semester_id, :section_4_1, :section_4_2, :section_5_1, :section_5_2, :section_5_3, :section_5_4
  validates_numericality_of :section_4_1, :section_4_2, :section_5_1, :section_5_2, :section_5_3, :section_5_4

  def school
    school_semester.school
  end
end
