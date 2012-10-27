class Report < ActiveRecord::Base
  belongs_to :school
  has_one    :static_content
  has_one    :dynamic_content
  validate :school_id, :presence => true
end
