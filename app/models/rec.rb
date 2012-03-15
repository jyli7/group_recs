class Rec
  attr_accessor :title, :image_url, :rating, :trailer, :synopsis, :directed_by
  
  def initialize(rec)
    @name = rec[:name]
    @title = rec[:title]
    @image_url = rec[:image_url]
    @rating = rec[:rating]
    @trailer = rec[:trailer] || "No trailer available"
    @synopsis = rec[:synopsis]
    @directed_by = rec[:directed_by]
  end
end
