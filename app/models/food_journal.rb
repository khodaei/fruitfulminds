class FoodJournal < ActiveRecord::Base
  belongs_to :school_info
  belongs_to :user
end
