class UsersController < ApplicationController
  before_action :authenticate_user!

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation, :current_password)
  end

  def show
    @user = User.find_by(id: params[:id]);
    if @user
    else
      flash[:danger]= 'notfound'
      redirect_to root_path
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
  end

end
