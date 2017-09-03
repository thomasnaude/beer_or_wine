class DrinksController < ApplicationController
  def index
    @query = params[:query]
    @drinks = PgSearch.multisearch(@query)
  end
end
