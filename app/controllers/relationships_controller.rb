class RelationshipsController < ApplicationController
  before_action :check_exists_follow, only: [:destroy]
  def create
    @user = User.find(params[:followed_id])
    unless current_user.following?(@user)
      current_user.follow(@user)
      @notification = Notification.find_by from_user_id: @current_user.id, to_user_id: @user.id, type: Notification.types[:follow];
      if @notification
        @notification.update_attributes status: Notification.statuses[:not_seen]
      else
        @notification = Notification.new(
            from_user_id: @current_user.id,
            to_user_id: @user.id,
            type: Notification.types[:follow],
            review_id: -1,
            status: Notification.statuses[:not_seen]
        );
      end
      @notification.save
    end
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    if current_user.following?(@user)
      current_user.unfollow(@user)
      @notification = Notification.find_by from_user_id: @current_user.id, to_user_id: @user.id, type: Notification.types[:follow], status: Notification.statuses[:not_seen]
      if @notification
        @notification.destroy
      end
    end
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def check_exists_follow
    if Follow.find_by(id: params[:id])
      true
    else
      false
    end
  end
end
