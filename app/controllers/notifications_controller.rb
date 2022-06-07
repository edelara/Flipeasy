class NotificationsController < ApplicationController
  def create
    skip_authorization
  end

end
