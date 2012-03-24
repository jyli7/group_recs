class HomeController < ApplicationController

  caches_action :index, :layout => :false, :cache_path => Proc.new { |c| user_url(c.send(:current_user).id) }, :expires_in => 10.minutes

  def index
    @friends = current_user.friends
    render :no_friends unless has_friends?
  end

  private

  def has_friends?
    current_user.friends.any?
  end

end
