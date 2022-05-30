class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
      t.string :progress
      t.string :company_name
      t.string :company_email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
