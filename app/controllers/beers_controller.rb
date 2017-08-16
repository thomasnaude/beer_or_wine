class BeersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new, :create, :edit, :update]

  def index
    @beers = Beer.all
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

  private

  def find_beer
    Beer.find(params[:id])
  end

  def beer_params
    params.require(:beer).permit(:name, :brewery, :style, :country, :photo)
  end
end
