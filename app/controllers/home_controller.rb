class HomeController < ApplicationController

  caches_action :index, :layout => :false, :cache_path => Proc.new { |c| user_path(c.send(:current_user).id) }, :expires_in => 10.minutes

  def index
    @friends = current_user.friends
    unless has_friends?
      expire_fragment(user_path(current_user.id))
      render :no_friends
    end
  end

  private

  def has_friends?
    current_user.friends.any?
  end

end
