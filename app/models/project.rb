class Project < ApplicationRecord
  has_many :documents
  has_many :steps
  belongs_to :user
end
