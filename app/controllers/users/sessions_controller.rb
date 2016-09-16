class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  def create
    @user = User.find_by_email(params[:user][:email])

     if @user.present? and @user.valid_password?(params[:user][:password])

      if @user.status
        sign_in(@user, :bypass => true)

        redirect_to '/'
      else
        redirect_to new_user_session_path, notice: "you are blocked by admin"
      end
    else
      redirect_to new_user_session_path, notice: "invalid password"
      end
  end



  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
