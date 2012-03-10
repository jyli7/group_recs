require 'spec_helper'

describe FriendsController do
  before do
    @user = Factory(:user)
    stub_friends_call
  end

  describe "#index" do
    it "should find the friends" do
      User.stub!(:find).and_return(@user)
      @user.should_receive(:friends)
      get :index, :id => @user.id
    end
    
    it "should find the user" do
      get :index, :id => @user.id
      assigns(:user).should == @user
    end
  end
end