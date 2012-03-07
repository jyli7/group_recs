require 'spec_helper'

describe User do
  before do 
    @user = Factory(:user, :email => "foo@bar.com", :auth_token => "b05a90da871cb1cbf32ad5a78ed0381469934c7d")
  end
  
  describe "#get_auth_token" do
    it "should return the auth token" do
      key_that_works = "nbmfsyahvr7027331"
      user_id_that_works = "hn_7027331"
      @user.get_auth_token(key_that_works, user_id_that_works).should == @user.auth_token
    end
  end
  
  describe "#get_recommended books" do
    it "should return a list of books" do
      @user.get_recommended_books(@user.auth_token, 50).length.should == 50
    end
  end
  
  describe "#get_single_result" do
    it "should return the JSON for a single result'" do
      query = "The Da Vinci Code"
      @user.get_single_result(query)["recommendations"].length.should >= 1
    end
  end
  
  describe "validations" do
    it "requires an email" do
      invalid_user = Factory.build(:user)
      invalid_user.should_not be_valid
    end
  end
end