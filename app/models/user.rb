class User < ActiveRecord::Base

  def user_id=(value)
    self.hunch_id = value
  end

  def get_recommended_books(user_auth_token, limit)
    get_books = open("http://api.hunch.com/api/v1/get-recommendations/?auth_token=#{user_auth_token}&topic_ids=list_book&fields=title,stars,average_ratings&limit=#{limit}").read
    get_books_json = JSON.parse(get_books)
    recommended_books = get_books_json["recommendations"]
  end
  
  def get_single_result(query)
    query.gsub!(" ", "+")
    single_result = open("http://api.hunch.com/api/v1/get-recommendations/?auth_token=#{self.auth_token}&topic_ids=list_book&query=#{query}&fields=title,stars,average_ratings").read
    single_result_json = JSON.parse(single_result)
  end
  
  def friends(limit = 15)
    @friends ||= HunchAPI.get_friends(limit).map { |friend| Friend.new(friend) }
  end
  
  def group_recs(user_ids, limit = 15)
    @group_recs ||= HunchAPI.get_group_recs(user_ids, limit).map { |rec| Rec.new(rec) }
  end
  
end
