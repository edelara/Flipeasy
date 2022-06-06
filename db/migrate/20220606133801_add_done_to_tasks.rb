class AddDoneToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :done, :boolean, default: 0
  end
end
