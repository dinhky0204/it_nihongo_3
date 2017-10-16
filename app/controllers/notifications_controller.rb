class NotificationsController < ApplicationController
  def update
    if current_user
      current_user.notifications.update_all status: :seen
    end
    respond_to do |format|
      format.js
    end
  end
end