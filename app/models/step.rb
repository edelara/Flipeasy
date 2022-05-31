class Step < ApplicationRecord
  has_many :tasks
  belongs_to :user
  belongs_to :project

  validates :name, presence: true
  validates :deadline, presence: true
end
