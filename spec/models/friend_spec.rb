require 'spec_helper'

describe Friend do
  describe "#to_s" do
    it "should tell you the id and the name of the friend" do
      friend = Friend.new(user_id: "111", name: "Joe Green")
      friend.to_s.should == "id: #{ friend.user_id }, name: #{ friend.name }"
    end
  end
  
  describe "#<=>" do
    it "should compare friends by name" do
      zach = Friend.new(user_id: "111", name: "Zach")
      alex = Friend.new(user_id: "222", name: "Alex")
      (alex <=> zach).should == -1
    end
  end
  
end