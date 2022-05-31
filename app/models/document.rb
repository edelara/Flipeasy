class Document < ApplicationRecord
  belongs_to :project
  has_many_attached :files

  validates :name, presence: true
end
