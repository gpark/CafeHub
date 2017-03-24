class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :sign_up_code
    ) }
  end

  def get_all_times
    return Array.new(24.hours / 30.minutes) {|i| [(Time.now.midnight + (i*30.minutes)).strftime("%I:%M %p"), (Time.now.midnight + (i*30.minutes)).strftime("%I:%M %p")]}
  end

  def get_chosen_week(weeks, params)
    if params.key?(:assignments_week_id)
      return params[:assignments_week_id]
    else
      if weeks.length > 0
        return weeks[0][1]
      else
        return 0
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path, alert: flash[:warning]
  end

end
