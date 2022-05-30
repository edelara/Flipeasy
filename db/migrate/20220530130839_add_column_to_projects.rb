class AddColumnToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :team_member, null: false, foreign_key: true
    add_reference :projects, :company, null: false, foreign_key: true
  end
end
