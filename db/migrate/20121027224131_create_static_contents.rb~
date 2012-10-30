class CreateStaticContents < ActiveRecord::Migration
  def change
    create_table :static_contents do |t|
      t.references 'report'
      t.text "intro_title"
      t.text "introduction"
      t.text "objectives_title"
      t.text "objectives"
      t.text "eval_title"
      t.text "strength_weakness_intro"
      t.text "strength_intro"
      t.text "weakness_intro"
      t.text "summary"

      t.timestamps
    end
  end
end
