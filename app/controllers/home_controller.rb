class HomeController < ApplicationController

  caches_action :index, :if => [:current_user, :has_friends?], :layout => false, :cache_path => Proc.new { |c| user_path(c.send(:current_user).id) }, :expires_in => 10.minutes

  def index
    @friends = current_user.friends
    current_user.update_attribute(:has_friends, true) if !current_user.has_friends && @friends.any?
    render :no_friends unless @friends.any?
  end

  private

  def has_friends?
    current_user.has_friends?
  end

end
