class CreateReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :school_id
      t.string :content

      t.timestamps
    end
  end
end
