class User < ActiveRecord::Base
  
  after_create :get_info

  validates_presence_of :hunch_id

  def user_id=(value)
    self.hunch_id = value
  end
  
  def friends(limit = 2000)
    @friends ||= HunchAPI.get_friends(limit).map { |friend| Friend.new(friend) }.sort
  end
  
  def group_recs(user_ids, limit = 25)
    @group_recs ||= HunchAPI.get_group_recs(user_ids, limit).map { |rec| Rec.new(rec) }
  end

  private
  
  def get_info
    HunchAPI.token = auth_token
    update_attributes(HunchAPI.get_user)
  end
  
end
