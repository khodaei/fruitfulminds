class Report < ActiveRecord::Base
  belongs_to :school
  has_one    :static_contents
  has_one    :dynamic_contents
  validate :school_id, :presence => true
end
