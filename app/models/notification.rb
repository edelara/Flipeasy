class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :task

  after_create :broadcast

  private

  def broadcast
    NotificationChannel.broadcast_to(
      self.user,
      project_path: Rails.application.routes.url_helpers.project_path(task.step.project),
      notification_html: ApplicationController.new.render_to_string(partial: "notifications/show", locals: { notification: self }, formats: :html)
    )
  end
end
