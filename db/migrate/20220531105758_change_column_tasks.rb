class ChangeColumnTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :status, :string, default: "Not started"
  end
end
