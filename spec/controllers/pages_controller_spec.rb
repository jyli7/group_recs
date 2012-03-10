require 'spec_helper'

describe PagesController do
  describe 'POST #get_user_email' do
    before { post :get_user_email, :email => "joe@gmail.com" }
    
    it "should create a user" do
      assigns(:user).should_not be_nil
    end
  end

  
end
  