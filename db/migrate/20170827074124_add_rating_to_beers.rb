class AddRatingToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :rating, :integer
  end
end
