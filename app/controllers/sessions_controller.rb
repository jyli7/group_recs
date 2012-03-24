class SessionsController < ApplicationController
  protect_from_forgery
  
  skip_before_filter :require_user, :only => [:new, :create]
  before_filter :ensure_not_logged_in, :only => [:new, :create]
  
  def new
    @hunch_login_url = HunchAPI.login_url
  end

  def create
    credentials = HunchAPI.get_token(params[:auth_token_key]).merge(:user_id => params[:user_id])
    @user = User.find_by_hunch_id(credentials[:user_id]) || User.create(credentials)
    session[:user_id] = @user.id
    flash[:notice] = "You're logged in!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out"
    redirect_to login_url
  end
  
end
