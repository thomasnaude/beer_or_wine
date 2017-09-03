class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :root_path

  def root_path
    user_signed_in? ? authenticated_root_path : unauthenticated_root_path
  end
end
