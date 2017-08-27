module  ImageHelper
  def card_background_image(object)
    return unless object.photo?
    "background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('#{cl_image_path object.photo.path}');"\
    "background-size: cover;"
  end
end
