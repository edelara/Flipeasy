class CreateLawFirms < ActiveRecord::Migration[7.0]
  def change
    create_table :law_firms do |t|
      t.string :name

      t.timestamps
    end
  end
end
