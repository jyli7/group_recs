class Rec
  attr_accessor :name, :title, :description, :image_url, :url, :rating, :trailer, :rt_rating, :imdb_rating
  
  def initialize(rec)
    @name = rec[:name]
    @title = rec[:title]
    @description = rec[:description]
    @image_url = rec[:image_url]
    @url = rec[:url]
    @rating = rec[:rating]
    @trailer = rec[:trailer] || "No trailer available"
    @rt_rating = rec[:rt_rating]
    @imdb_rating = rec[:imdb_rating]
  end
end