class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  force_ssl if: :ssl_configured?


  private
  def restrict_access_by_token
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.find_by_authentication_token(token)
      @current_user ||= false
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(user:[:email, :password]) }
  end

  def ssl_configured?
    !Rails.env.development? && !params[:controller]=='mon'
  end

end
