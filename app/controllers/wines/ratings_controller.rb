class Wines::RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:edit]
  def edit
    @wine = Wine.find(params[:wine_id])
  end
end
