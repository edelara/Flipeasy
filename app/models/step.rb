class Step < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :project

  validates :name, uniqueness: true
  validates :deadline, presence: true
end
