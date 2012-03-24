require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from OpenURI::HTTPError, :with => :revoked_application
  # rescue_from Exception, :with => :error_page

  before_filter :require_user
  before_filter :set_token, :if => :current_user
 
  private

  def require_user
    redirect_to login_url unless current_user
  end
  
  def ensure_not_logged_in
    if current_user
      flash[:notice] = "You're already logged in!"
      redirect_to root_path
    end
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
    
  def set_token
    HunchAPI.token = @current_user.auth_token
  end

  def revoked_application
    flash[:error] = "Something went wrong!"
    User.destroy(session[:user_id]) rescue nil
    session[:user_id] = nil
    redirect_to login_url
  end
  
  def error_page
    render "shared/error"
  end
  
end
