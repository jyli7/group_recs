require 'open-uri'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_user
  before_filter :set_token, :if => :current_user

  private

  def require_user
    redirect_to login_url unless current_user
  end
  
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
    
  def set_token
    HunchAPI.token = @current_user.auth_token
  end
end
