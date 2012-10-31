class CreateFoodJournals < ActiveRecord::Migration
  def change
    create_table :food_journals do |t|
      t.integer :school_id
      t.integer :user_id
      t.integer :semester_id
      t.integer :week_num
      t.string :student_name
      t.integer :fruit
      t.integer :vegetable
      t.integer :sugary_drink
      t.integer :water

      t.timestamps
    end
  end
end
