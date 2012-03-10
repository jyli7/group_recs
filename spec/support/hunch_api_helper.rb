def stub_friends_call
  HunchAPI.token = "b05a90da871cb1cbf32ad5a78ed0381469934c7d"
  HunchAPI.stub!(:get_friends).and_return(JSON.parse(File.read("spec/data/friends.json"))['friends'])
end