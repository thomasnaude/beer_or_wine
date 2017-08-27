module ApplicationHelper
  def stars(rating)
    return "Noter cette bière" if rating.nil?
    stars = []
    rating.times { stars << '<i class="fa fa-star" aria-hidden="true"></i>' }
    (5 - rating).times { stars << '<i class="fa fa-star-o" aria-hidden="true"></i>' }
    stars.join().html_safe
  end

  def card_background_image(object)
    return unless object.photo?
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('#{cl_image_path object.photo.path}');"\
    "background-size: cover;"
  end
end
