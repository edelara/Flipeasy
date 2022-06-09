class Task < ApplicationRecord
  belongs_to :step
  has_one :project, through: :step
  has_many :notifications, dependent: :destroy
  belongs_to :user, optional: true
  STATUS = ["Not started", "In Progress", "Completed"]

  validates :status, inclusion: { in: Task::STATUS }, presence: true
  validates :status, presence: true
  after_save :notify_task_completion

  def task_completed?
    status == "Completed"
  end

  def notify_task_completion
    return unless done?

    Notification.create(title: "Task completed",
                        message: "#{self.name} has been completed for #{self.project.name}.",
                        task: self,
                        user: project.user)
  end
end
