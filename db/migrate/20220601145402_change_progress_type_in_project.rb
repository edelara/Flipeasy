class ChangeProgressTypeInProject < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :progress
    add_column :projects, :progress, :integer, default: 0
  end
end
