require 'spec_helper'

describe RecommendationsController do
  describe "GET #show" do
    before do
      @user = Factory(:user, email: "test@gmail.com")
    end
    
    it "should find the user" do
      get :show, user_id: @user.id
      assigns(:user).should == @user
    end
    
    it "it should call 'get recommended books' on the user" do
      User.stub(:find).and_return(@user)
      @user.should_receive(:get_recommended_books)
      get :show, user_id: @user.id
    end
  end
end