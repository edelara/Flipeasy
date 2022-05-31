class Task < ApplicationRecord
  belongs_to :step
  belongs_to :user
  STATUS = ["Closed", "Close failed", "In Process", "Pending", "Completed"]

  validates :status, inclusion: { in: Task::STATUS }, presence: true
  validates :name, presence: true
end
