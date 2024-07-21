class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def star_rating
    rating = object.rating
    full_stars = rating.floor
    half_stars = (rating % 1 >= 0.5) ? 1 : 0
    empty_stars = 5 - full_stars - half_stars
  
    stars = ('<li><i class="fa fa-star"></i></li>' * full_stars) +
            ('<li><i class="fa fa-star-half-o"></i></li>' * half_stars) +
            ('<li><i class="fa fa-star-o"></i></li>' * empty_stars)
  
    stars.html_safe
  end
  
  

end
