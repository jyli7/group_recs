require 'spec_helper'

describe HunchAPI do

  it "should have the correct login url" do
    HunchAPI.login_url.should include("authorize")
  end
  
  it "should have the correct friends url" do
    limit = 10
    HunchAPI.friends_url(limit).should include("#{HunchAPI.base_url}")
    HunchAPI.friends_url(limit).should include("get-friends")
    HunchAPI.friends_url(limit).should include("10")
  end
  
  it "should have the correct user url" do
    HunchAPI.user_url.should include("#{HunchAPI.base_url}")
    HunchAPI.user_url.should include("get-user")
  end
  
  it "should have the correct group_recs_url" do
    user_ids = [111, 222]
    limit = 10
    HunchAPI.group_recs_url(user_ids, limit).should include("#{HunchAPI.base_url}")
    HunchAPI.group_recs_url(user_ids, limit).should include("#{user_ids.join(",")}")
    HunchAPI.group_recs_url(user_ids, limit).should include("#{limit}")
  end
  
  it "should set the token" do
    HunchAPI.token = "1234"
    HunchAPI.token.should == "1234"
  end
  
  describe "with a token" do
    before do
      HunchAPI.token = 'b05a90da871cb1cbf32ad5a78ed0381469934c7d'
    end
      
    it "should return a list of friends" do
      HunchAPI.get_friends.length.should > 1
    end
  end
end