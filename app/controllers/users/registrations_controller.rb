class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: :cancel
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  def update
    # required for settings form to submit when password is left blank
    @user = User.find(current_user.id);
    current_password = params[:user][:current_password];
    puts params[:user];
    params[:user].delete("current_password");
    if params[:user][:password].blank?
      params[:user].delete("password");
      params[:user].delete("password_confirmation");
    end
    #if params[:user][:avatar].blank?
        if !@user.my_valid_password?(current_password)
          if @user.errors.full_messages.any?
            if flash[:error].blank?
              flash[:error] = @user.errors.full_messages;
            else
              flash[:error] += @user.errors.full_messages;
            end
          end
          return redirect_to after_update_path_for(@user)
        end
    #end

    if @user.update_attributes(params[:user].permit(:name, :email, :gender, :address, :birthday, :password, :password_confirmation,:avatar, :avatar_cache, :remove_avatar))
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      if @user.errors.full_messages.any?
        if flash[:error].blank?
          flash[:error] = @user.errors.full_messages;
        else
          flash[:error] += @user.errors.full_messages;
        end
      end
      redirect_to after_update_path_for(@user)
    end
 end


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name, :gender, :address, :birthday, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar])
   end

  #The path used after sign up.
   def after_sign_up_path_for(resource)
     user_path(resource)
   end

  def after_update_path_for(resource)
    user_path(resource)
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
