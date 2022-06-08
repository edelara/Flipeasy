class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :task

  after_create :broadcast

  private


  def broadcast
    NotificationChannel.broadcast_to(
      self.user,
      ApplicationController.new.render_to_string(partial: "notifications/show", locals: {notification: self})
    )
  end
end
