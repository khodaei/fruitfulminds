class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.integer :school_semester_id
      t.string :type
      t.integer :section_1
      t.integer :section_2
      t.integer :section_3
      t.integer :section_4
      t.integer :section_5
      t.integer :section_6

      t.timestamps
    end
  end
end
