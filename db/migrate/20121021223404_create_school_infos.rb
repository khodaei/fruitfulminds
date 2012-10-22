class CreateSchoolInfos < ActiveRecord::Migration
  def change
    create_table :school_infos do |t|
      t.references  :school
      t.references  :user
      t.integer     :year
      t.string      :semester 

      t.timestamps
    end
  end
end
