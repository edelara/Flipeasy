class Step < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :project

  validates :name, presence: true
  validates :deadline, presence: true

  after_save :update_project_progress

  def completed?
    # TO DO => ajouter la logique pour mettre à jour la colonne completed_at lorsque
    # la dernière task du step est complétée
    completed_at.present?
  end

  private

  def update_project_progress
    unless self.completed_at.nil?
      completed_step_counter = project.steps.where.not(completed_at: nil).count
      project.update(progress: completed_step_counter.fdiv(project.steps.count) * 100)
    end
  end
end
