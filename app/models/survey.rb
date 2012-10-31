class Survey < ActiveRecord::Base
  belongs_to :school_semester
  belongs_to :user
  validates_presence_of :user_id, :school_semester_id

  def school
    school_semester.school
  end
end
