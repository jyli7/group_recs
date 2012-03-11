class PagesController < ApplicationController
  protect_from_forgery
  
  def index
    
  end
    
  def after_hunch
    auth_token_key = params[:auth_token_key]
    user_id = params[:user_id]
    @user = current_user
    auth_token = @user.get_auth_token(auth_token_key, user_id)
    @user.update_attribute :auth_token, auth_token
    redirect_to '/user/friends'
  end

end