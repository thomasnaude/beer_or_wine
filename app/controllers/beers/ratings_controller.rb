class Beers::RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:edit]
  def edit
    @beer = Beer.find(params[:beer_id])
  end
end
