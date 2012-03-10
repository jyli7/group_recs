require 'spec_helper'

describe FriendsController do
  describe "#index" do
    before do
      @user = Factory(:user)
      get :index, :id => @user.id
    end
    
    it "should find the user" do
      assigns(:user).should == @user
    end  
  end
end