module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-dismissable alert-info"
      when 'success' then "alert alert-dismissable alert-success"
      when 'error' then "alert alert-dismissable alert-danger"
      when 'alert' then "alert alert-dismissable alert-danger"
    end
  end

  def current_user?(user)
    return user == current_user;
  end
=begin
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end
=end
end
