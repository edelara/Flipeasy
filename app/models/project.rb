class Project < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :steps, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :start_at, presence: true
  validates :company_name, presence: true
  validates :company_email, presence: true

  after_validation :set_end_at
  after_create :create_steps_and_tasks

  private

  def set_end_at
    return unless end_at.blank?

    self.end_at = start_at + 60.days
  end

  def create_steps_and_tasks
    CreateStepsAndTasksForProject.new(self).call
  end
end
