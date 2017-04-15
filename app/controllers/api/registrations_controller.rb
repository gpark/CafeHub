class Api::RegistrationsController < Api::BaseController
  skip_before_filter :authenticate_user_from_token!

  def create
    @user = User.new(user_params)
    @auth_token = jwt_token(@user)
    @user.session_token = @auth_token
    
    if @user.save
      render :create
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :sign_up_code,
      :provider,
      :uid
    )
  end
end
