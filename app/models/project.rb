class Project < ApplicationRecord
  has_many :documents
  has_many :steps
  belongs_to :user

  validates :name, presence: true
  validates :company_name, presence: true
  validates :company_email, presence: true
end
