class RecommendationsController < ApplicationController
  protect_from_forgery
  
  def show
    @group_recs = current_user.group_recs(user_ids)
  end
  
  private
  
  def user_ids
    params[:recommendations][:user_ids].split(',')
  end
  
end