class Document < ApplicationRecord
  belongs_to :project
  has_one_attached :file
  STATUS = ["Submission Pending", "Review Pending", "Validated"]


  validates :name, presence: true
end
