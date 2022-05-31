class AddDurationToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :duration, :integer
  end
end
