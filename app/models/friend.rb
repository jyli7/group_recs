class Friend
  attr_accessor :user_id, :name, :image_url
  
  def initialize(params)
    @user_id = params[:user_id]
    @name = params[:name]
    @image_url = params[:image_url]
  end
  
  def to_s
    "id: #{user_id}, name: #{name}"
  end
end