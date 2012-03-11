class HunchAPI
  
  class << self
    def token=(token)
      @token = token
    end
  
    def token
      @token
    end
  
    def login_url
      'http://hunch.com/authorize/v1/?app_id=3147694&next=/after_hunch'
    end
  
    def get_friends(limit)
      get_data(friends_url(limit))["friends"]
    end
  
    def friends_url(limit)
      "#{base_url}/get-friends?auth_token=#{token}&limit=#{limit}"
    end
    
    def group_recs_url(user_ids, limit)
      ids_list = user_ids.join(',')
      "#{base_url}/get-recommendations?topic_ids=list_movie&auth_token=#{token}&group_user_ids=#{ids_list}&limit=#{limit}"
    end
  
    def base_url
      "http://api.hunch.com/api/v1"
    end
  
    def get_data(url)
      HashWithIndifferentAccess.new(JSON.parse(open(url).read))
    end
    
    def get_group_recs(user_ids, limit)
      get_data(group_recs_url(user_ids, limit))["recommendations"]
    end  
  end
end