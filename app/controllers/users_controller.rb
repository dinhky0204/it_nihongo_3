class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:id]);
    if @user
    else
      flash[:danger]= 'notfound'
      redirect_to root_path
    end
  end
end
