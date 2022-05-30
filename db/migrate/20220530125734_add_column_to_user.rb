class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role, :string
    add_reference :users, :company, null: false, foreign_key: true
    add_reference :users, :law_firm, null: false, foreign_key: true
  end
end
