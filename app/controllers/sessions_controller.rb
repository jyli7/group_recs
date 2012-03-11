class SessionsController < ApplicationController
  protect_from_forgery
  
  skip_before_filter :require_user, :only => [:new, :create]
  
  def new
    @hunch_login_url = HunchAPI.login_url
  end

  def create
    @user = User.find_by_hunch_id(params[:user_id]) || User.create(:hunch_id => params[:user_id], :auth_token => params[:auth_token])
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end
