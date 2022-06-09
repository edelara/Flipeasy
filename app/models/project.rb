class Project < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :tasks, through: :steps
  has_many :users, -> { distinct }, through: :steps
  has_many :notifications, through: :steps
  belongs_to :user
  has_one_attached :photo
  acts_as_taggable_on :tags
  DURATION = [21, 30, 45]

  validates :name, presence: true, uniqueness: true
  validates :start_at, presence: true
  validates :company_name, presence: true
  validates :company_email, presence: true
  validates :duration, inclusion: { in: Project::DURATION }, presence: true

  after_validation :set_end_at
  after_create :create_steps_and_tasks

  def current_step_name
    if steps.where(completed_at: nil).count.zero?
      "Completed"
    else
      steps.find_by(:completed_at.nil?).name
    end
  end

  private

  def set_end_at
    return unless end_at.blank?
    return if start_at.blank? || duration.blank?

    self.end_at = start_at + duration.days
  end

  def create_steps_and_tasks
    CreateStepsAndTasksForProject.new(self).call
  end
end
