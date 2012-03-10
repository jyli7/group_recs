class Rec
  attr_accessor :name, :title, :description, :image_url, :url, :rating
  
  def initialize(rec)
    @name = rec[:name]
    @title = rec[:title]
    @description = rec[:description]
    @image_url = rec[:image_url]
    @url = rec[:url]
    @rating = rec[:rating]
  end
end