class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :auto_login!
  before_action :set_categories, if: :is_get?

  helper_method :current_user

  def is_get?
    request.get?
  end

  def set_categories
    @categories = Category.not_subcategory
  end

  def logged_in?
     !!current_user
  end

  def current_user
    @current_user
  end

  protected
  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def auto_login!
    @current_user ||= User.find(auth_token[:user_id]) unless auth_token.blank?
  end

  private
  def http_token
      # @http_token ||= if request.headers['Authorization'].present?
      #   request.headers['Authorization'].split(' ').last
      # end
      @http_token ||= cookies[:login]
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
