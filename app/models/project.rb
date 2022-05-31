class Project < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :steps, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :company_name, presence: true
  validates :company_email, presence: true

  # after_create :create_steps_and_tasks

  private

  def create_steps_and_tasks
    CreateStepsAndTasksForProject.new(self).call
  end
end
