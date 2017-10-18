class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    message = " has followed you"
    @from_user = User.find_by(id: notification.from_user_id)
    @to_user =  User.find_by(id: notification.to_user_id)
    counter = @to_user.notifications.filter_not_seen.count

    # fix error Devise could not find the Warden::Proxy
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(@to_user, scope: "user") }
    renderer = ApplicationController.renderer.new(
        warden: proxy
    )
    list_notifications_html = renderer.render(partial: "notifications/list_in_top.html.erb", locals: { user: @to_user })
    if @from_user
      message = @from_user.name + message
    end
    if @to_user
      url = Rails.application.routes.url_helpers.user_url(@to_user);
    end
    ActionCable.server.broadcast "notification_channel:#{notification.to_user_id}",
                                 counter: counter,
                                 notification: notification,
                                 message: message,
                                 url: url,
                                 list_notifications_html: list_notifications_html
  end
end
