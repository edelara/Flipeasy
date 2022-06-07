class ChangeUrlToProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :URL
    add_column :projects, :company_landing_page, :string
  end
end
