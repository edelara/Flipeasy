class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :law_firm, null: false, foreign_key: true
  end
end
