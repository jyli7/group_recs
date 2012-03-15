module ApplicationHelper

  def rating_to_pixels(rating)
    rating ? ((rating / 10) * 65 + 0.5).floor : 0
  end

end
