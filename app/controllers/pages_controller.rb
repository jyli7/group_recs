class PagesController < ApplicationController
  protect_from_forgery
  
  def index
    
  end
    
  def after_hunch
    auth_token_key = params[:auth_token_key]
    user_id = params[:user_id]
    redirect_to '/user/friends'
  end

end
