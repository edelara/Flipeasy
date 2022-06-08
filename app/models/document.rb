class Document < ApplicationRecord
  belongs_to :project
  has_one_attached :file
  STATUS = ["Done", "Review Pending", "Drafting", "No Draft"]


  validates :name, presence: true
end
