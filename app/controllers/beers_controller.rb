class BeersController < ApplicationController
  def index
    @beers = Beer.includes(:photo_files).order(rating: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @beer = find_beer
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      redirect_to @beer
    else
      render :new
    end
  end

  def edit
    @beer = find_beer
  end

  def update
    @beer = find_beer
    if @beer.update(beer_params)
      redirect_to @beer
    else
      render :edit
    end
  end

  def autocomplete_brewery
    breweries = Beer.search_by_brewery(params[:query])
                       .limit(50)
                       .pluck(:brewery)
                       .uniq
                       .first(10)
    render json: breweries
  end

  private

  def find_beer
    Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style, :country, :photo, :rating, :comment)
  end
end
