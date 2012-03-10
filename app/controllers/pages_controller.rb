class PagesController < ApplicationController
  protect_from_forgery
  
  def index
    
  end
  
  def get_user_email
    @user = User.create!(:email => params[:email])
    redirect_to 'http://hunch.com/authorize/v1/?app_id=3147694&next=/after_hunch'
  end
  
  def after_hunch
    auth_token_key = params[:auth_token_key]
    user_id = params[:user_id]
    @user = User.last
    auth_token = @user.get_auth_token(auth_token_key, user_id)
    @user.update_attribute :auth_token, auth_token
  end

end