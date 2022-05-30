class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :status
      t.date :deadline
      t.date :completed_at
      t.references :project, null: false, foreign_key: true
      # t.references :team_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
