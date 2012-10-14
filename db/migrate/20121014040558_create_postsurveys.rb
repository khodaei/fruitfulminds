class CreatePostsurveys < ActiveRecord::Migration
  def change
    create_table :postsurveys do |t|
      t.references 'school'
      t.integer :section_1
      t.integer :section_2
      t.integer :section_3
      t.integer :section_4
      t.integer :section_5
      t.integer :section_6
      t.integer :efficacy_1
      t.integer :efficacy_2
      t.integer :efficacy_3
      t.integer :efficacy_4
      t.integer :efficacy_5
      t.integer :efficacy_6
      t.integer :efficacy_7
      t.integer :efficacy_8
      t.integer :efficacy_9
      t.integer :efficacy_10

      t.timestamps
    end
  end
end
