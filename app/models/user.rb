class User < ActiveRecord::Base

  def user_id=(value)
    self.hunch_id = value
  end
  
  def friends(limit = 20)
    @friends ||= HunchAPI.get_friends(limit).map { |friend| Friend.new(friend) }
  end
  
  def group_recs(user_ids, limit = 15)
    @group_recs ||= HunchAPI.get_group_recs(user_ids, limit).map { |rec| Rec.new(rec) }
  end
  
end
