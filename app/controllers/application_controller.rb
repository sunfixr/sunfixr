class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 # force_ssl if: :ssl_configured?
  include ApplicationHelper

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

  def get_project
    project_id = params[:project_id] || params[:id]
    @project = project_id.match(/^[0-9]*$/) ? Project.find_by_id(project_id) : Project.find_by_slug(project_id.downcase)
    render :file => "#{Rails.root}/public/404.html", layout: false,  :status => 404 unless @project
  end

end
