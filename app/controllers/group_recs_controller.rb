class GroupRecsController < ApplicationController
  
  before_filter :find_user
  
  def create
    redirect_to user_group_recs_path(:id => @user.id, :user_ids => selected_users)
  end
  
  def show
    @group_recs = @user.group_recs(params[:user_ids])
  end
  
  def selected_users
    params[:group_recs].select { |k, v|  v == "1" }.map { |k, v| k }
  end
  
  private
  
  def find_user
    @user = User.find(params[:id])
  end
  
end