class RemoveNullForUserInTasks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :user_id, true
  end
end
