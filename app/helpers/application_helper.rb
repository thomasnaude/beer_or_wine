module ApplicationHelper
  def stars(rating, options = {})
    return if rating.nil?
    stars = []
    rating.times { stars << "<i class='fa fa-star stars #{options[:class]}'' aria-hidden='true'></i>" }
    (5 - rating).times { stars << "<i class='fa fa-star stars--o #{options[:class]}' aria-hidden='true'></i>" }
    stars.join().html_safe
  end

  def card_background_image(object)
    return unless object.photo?
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), "\
    "url('#{cl_image_path object.photo.path, angle: "exif", width: 700, crop: "scale", quality: "auto"}');"\
    "background-size: cover;"
  end

  def background_image(object)
    return unless object.photo?
    "background-image: url('#{cl_image_path object.photo.path, angle: "exif", width: 700, crop: "scale", quality: "auto"}');"
  end

  def rate_this(drink)
    if drink.is_a?(Beer)
      "Noter cette bière"
    elsif drink.is_a?(Wine)
      "Noter ce vin"
    end
  end

  def submit_label(object)
    object = object.is_a?(Array) ? object.last : object
    object.persisted? ? "Modifier" : "Ajouter"
  end

  def svg_tag(name, options = {})
    file_path = Rails.root.join('app', 'assets', 'images', name)
    if File.exist?(file_path)
      content_tag(:div, class: options[:class]) { File.read(file_path).html_safe }
    else
      '(not found)'
    end
  end

  def bottom_nav_active(btn)
    klass = "bottom-nav__link--active"
    return klass if controller_name == btn.to_s
    klass if controller_name == 'pages' && action_name == btn.to_s
  end
end
