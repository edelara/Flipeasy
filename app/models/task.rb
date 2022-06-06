class Task < ApplicationRecord
  belongs_to :step
  belongs_to :user, optional: true
  STATUS = ["Not started", "In Progress", "Completed"]

  validates :status, inclusion: { in: Task::STATUS }, presence: true
  validates :status, presence: true

  def task_completed?
    status == "Completed"
  end
end
