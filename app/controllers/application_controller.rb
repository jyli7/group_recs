require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from OpenURI::HTTPError, :with => :revoked_application

  before_filter :require_user
  before_filter :set_token, :if => :current_user
 
  private

  def require_user
    redirect_to login_url unless current_user
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end
    
  def set_token
    HunchAPI.token = @current_user.auth_token
  end

  def revoked_application
    User.destroy(session[:user_id]) rescue nil
    session[:user_id] = nil
  end
end
