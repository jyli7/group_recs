require 'spec_helper'

describe HunchAPI do

  it "should have the correct login url" do
    HunchAPI.login_url.should include("authorize")
  end
  
  it "should set the token" do
    HunchAPI.token = "1234"
    HunchAPI.token.should == "1234"
  end
  
  # describe "with a token" do
  #   before do
  #     HunchAPI.token = 'b05a90da871cb1cbf32ad5a78ed0381469934c7d'
  #   end
  #     
  #   it "should return a list of friends" do
  #     HunchAPI.get_friends.length.should > 1
  #   end
  # end
end