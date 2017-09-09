class WinesController < ApplicationController
  def index
    @wines = Wine.all.order(rating: :desc)
  end

  def show
    @wine = find_wine
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      redirect_to @wine
    else
      render :new
    end
  end

  def edit
    @wine = find_wine
  end

  def update
    @wine = find_wine
    if @wine.update(wine_params)
      redirect_to @wine
    else
      render :edit
    end
  end

  def autocomplete_appellation
    appellations = Wine.search_by_appellation(params[:query])
                       .limit(50)
                       .pluck(:appellation)
                       .uniq
                       .first(10)
    render json: appellations
  end

  private

  def find_wine
    Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:name, :color, :appellation, :country, :photo, :rating)
  end
end
