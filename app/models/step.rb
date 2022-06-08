class Step < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :project

  validates :name, presence: true
  validates :deadline, presence: true

  after_save :update_project_progress

  def complete!
    update(completed_at: Date.today)
  end

  def not_complete!
    update(completed_at: nil)
  end

  def completed?
    completed_at.present?
  end

  private

  def update_project_progress
    unless self.completed_at.nil?
      completed_step_counter = project.steps.where.not(completed_at: nil).count
      project.update(progress: completed_step_counter.fdiv(project.steps.count) * 100)
      project.update(end_at: Date.today) if project.steps.where(completed_at: nil).count.zero?
    end
  end
end
