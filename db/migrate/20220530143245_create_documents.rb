class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :status, default: "Review Pending"
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
