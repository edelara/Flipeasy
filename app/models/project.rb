class Project < ApplicationRecord
  has_many :documents
  has_many :steps
  belongs_to :user
  DURATION = [21, 30, 45]

  validates :name, presence: true
  validates :company_name, presence: true
  validates :company_email, presence: true
  validates :duration, inclusion: { in: Project::DURATION }, presence: true
end
