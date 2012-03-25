class HomeController < ApplicationController

  caches_action :index, :layout => :false, :cache_path => Proc.new { |c| user_path(c.send(:current_user).id) }, :expires_in => 10.minutes
  after_filter :expire_cache, :unless => :has_friends?

  def index
    @friends = current_user.friends
    render :no_friends unless has_friends?
  end

  private

  def has_friends?
    current_user.friends.any?
  end

  def expire_cache
    expire_fragment(user_path(current_user.id))
  end

end
