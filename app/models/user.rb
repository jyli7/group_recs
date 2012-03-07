class User < ActiveRecord::Base
  validates_presence_of :email
  
  def get_auth_token(auth_token_key, user_id)
    get_auth_token = open("http://api.hunch.com/api/v1/get-auth-token/?app_id=3147694&auth_token_key=#{auth_token_key}&auth_sig=f7687b26dbb82fa80198830ad026b43837e8cfc2").read
    auth_token_json = JSON.parse(get_auth_token)
    auth_token = auth_token_json['auth_token']
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
end