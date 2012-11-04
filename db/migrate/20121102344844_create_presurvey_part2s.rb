class CreatePresurveyPart2s < ActiveRecord::Migration
  def change
    create_table :presurvey_part2s do |t|
      t.references :school_semester
      t.integer :section_4_1
      t.integer :section_4_2
      t.integer :section_5_1
      t.integer :section_5_2
      t.integer :section_5_3
      t.integer :section_5_4

      t.timestamps
    end
  end
end
