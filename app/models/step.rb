class Step < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :project

  validates :name, presence: true
  validates :deadline, presence: true
end
