class NotificationsController < ApplicationController
  def update
    if current_user
      current_user.notifications.update_all status: :seen
    end
    respond_to do |format|
      format.js
    end
  end

  def seen_notification
    @notification = Notification.find_by(:id => params[:notification_id])
    @notification.update_attributes status: :seen
    respond_to do |format|
      format.js
    end
  end

end