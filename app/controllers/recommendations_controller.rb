class RecommendationsController < ApplicationController
  protect_from_forgery
  
  def show
    @user = User.find(params[:user_id])
    @books = @user.get_recommended_books(@user.auth_token, 10)
  end
end