class Api::BaseController < ActionController::Base
  include ActionController::ImplicitRender
  respond_to :json

  before_filter :authenticate_user_from_token!

  protected

  def current_user
    if token_from_request.blank?
      nil
    else
      authenticate_user_from_token!
    end
  end

  alias devise_current_user current_user

  def user_signed_in?
    !current_user.nil?
  end

  alias devise_user_signed_in? user_signed_in?

  def authenticate_user_from_token!
    if claims && (user = User.find_by(email: claims[0]['user']))
      @current_user = user
    else
      render_unauthorized
    end
  end

  def claims
    JWT.decode(token_from_request, Rails.application.secrets.json_web_token_secret, true)
  rescue
    nil
  end

  def jwt_token(user)
    # 2 Weeks
    expires = Time.now.to_i + (3600 * 24 * 14)
    JWT.encode({ user: user.email, exp: expires }, ENV['AUTH_SECRET'], 'HS256')
  end

  def render_unauthorized(payload = { errors: { unauthorized: ['You are not authorized perform this action.'] } })
    render json: payload.merge(response: { code: 401 }), status: 401
  end

  def token_from_request
    # Accepts the token either from the header or a query var
    # Header authorization must be in the following format
    # Authorization: Bearer {yourtokenhere}
    (auth_header = request.headers['Authorization']) && (token = auth_header.split(' ').last)
    token = request.parameters['token'] if token.to_s.empty?

    token
  end
end
