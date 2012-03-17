require 'spec_helper'

describe RecommendationsController do
  describe "GET #show" do

    it "it should call 'get recommended books' on the user" do
      @user = Factory(:user)
      @user.should_receive(:get_recommended_books)
      get :show, user_id: @user.id
    end
  end
end