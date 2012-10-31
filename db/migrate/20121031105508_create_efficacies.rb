class CreateEfficacies < ActiveRecord::Migration
  def change
    create_table :efficacies, :id => false do |t|
      t.integer :efficacy_num
      t.integer :survey_id
      t.integer :num_agrees
      t.integer :num_dont_knows
      t.integer :num_disagrees

      t.timestamps
    end
    add_index :efficacies, [:efficacy_num, :survey_id], :unique => true
  end

end
