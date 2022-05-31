class Document < ApplicationRecord
  belongs_to :project
  has_one_attached :file

  validates :name, presence: true
end
