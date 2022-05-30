class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :founders
      t.string :address
      t.string :corporate_form

      t.timestamps
    end
  end
end
