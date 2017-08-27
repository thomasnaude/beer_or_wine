class DrinksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @query = params[:query]
    @drinks = PgSearch.multisearch(@query)
  end
end
