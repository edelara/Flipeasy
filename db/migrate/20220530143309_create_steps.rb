class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.date :deadline
      t.date :completed_at

      t.timestamps
    end
  end
end
