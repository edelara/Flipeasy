class RemoveNullForUserInSteps < ActiveRecord::Migration[7.0]
  def change
    change_column_null :steps, :user_id, true
  end
end
