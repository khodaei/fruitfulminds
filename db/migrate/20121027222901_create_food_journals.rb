class CreateFoodJournals < ActiveRecord::Migration
  def change
    create_table :food_journals do |t|

      t.timestamps
    end
  end
end
