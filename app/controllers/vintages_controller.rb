class VintagesController < ApplicationController
  before_action :set_vintage, only: [:edit, :update, :destroy]

  def new
    @wine = find_wine
    @vintage = Vintage.new
  end

  def create
    @wine = find_wine
    @vintage = @wine.vintages.build(vintage_params)
    if @vintage.save
      redirect_to @wine
    else
      render :new
    end
  end

  def edit
  end

  def update
    @wine = @vintage.wine
    if @vintage.update(vintage_params)
      redirect_to @wine
    else
      render :edit
    end
  end

  def destroy
    @vintage.destroy
    redirect_to @vintage.wine
  end

  private

  def set_vintage
    @vintage = Vintage.find(params[:id])
  end

  def find_wine
    Wine.find(params[:wine_id])
  end

  def vintage_params
    params.require(:vintage).permit(:year, :stock)
  end
end
