class HunchAPI
  
  class << self
    
    def base_url
      "http://api.hunch.com/api/v1"
    end
    
    def login_url 
      "http://hunch.com/authorize/v1/?app_id=3147694&next=/after_hunch"
    end
    
    def friends_url(limit)
      "#{base_url}/get-friends?auth_token=#{token}&limit=#{limit}"
    end
    
    def user_url
      "#{base_url}/get-user?auth_token=#{token}"
    end
    
    def group_recs_url(user_ids, limit)
      ids_list = user_ids.join(',')
      "#{base_url}/get-recommendations?topic_ids=list_movie&auth_token=#{token}&group_user_ids=#{ids_list}&limit=#{limit}"
    end
    
    def token=(token)
      @token = token
    end
  
    def token
      @token
    end

    def get_data(url)
      HashWithIndifferentAccess.new(JSON.parse(open(url).read))
    end
    
    def get_token_url(auth_token_key)
      "#{base_url}/get-auth-token/?app_id=3147694&auth_token_key=#{auth_token_key}"
    end
    
    def get_token(auth_token_key)
      token_url = get_token_url(auth_token_key)
      auth_sig = HunchUtils.auth_sig(token_url)
      get_data("#{token_url}&auth_sig=#{auth_sig}").slice(:user_id, :auth_token)
    end
    
    def get_user
      get_data(user_url).slice(:first_name, :image_url)
    end
  
    def get_friends(limit)
      get_data(friends_url(limit))["friends"]
    end
        
    def get_group_recs(user_ids, limit)
      get_data(group_recs_url(user_ids, limit))["recommendations"]
    end
  end
end
