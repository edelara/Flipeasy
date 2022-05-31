class ChangeColumnDocuments < ActiveRecord::Migration[7.0]
  def change
    change_column :documents, :status, :string, default: "Review Pending"
  end
end
