class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
=begin
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
=end
    redirect_to user_path(@user)
  end

  def destroy
    @user = Follow.find(params[:id]).followed
    current_user.unfollow(@user)
=begin
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
=end
    redirect_to user_path(@user)
  end
end
