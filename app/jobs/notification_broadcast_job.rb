class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification)
    message = notification.get_message()
    url = notification.get_url();
    puts "===============================================\n"
    puts message;
    puts "===============================================\n"
    @from_user = notification.from_user
    @to_user =  notification.to_user

    counter = @to_user.notifications.filter_not_seen.count

    # fix error Devise could not find the Warden::Proxy
    ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
    proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_user(@to_user, scope: "user") }
    renderer = ApplicationController.renderer.new(
        warden: proxy
    )
    list_notifications_html = renderer.render(partial: "notifications/list_in_top.html.erb", locals: { user: @to_user })


    ActionCable.server.broadcast "notification_channel:#{notification.to_user_id}",
                                 counter: counter,
                                 notification: notification,
                                 message: message,
                                 url: url,
                                 list_notifications_html: list_notifications_html
  end
end
