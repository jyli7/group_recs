class HomeController < ApplicationController
  
  def index
    @friends = current_user.friends
    render :no_friends if @friends.empty?
  end
  
end
