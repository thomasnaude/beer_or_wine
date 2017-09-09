class AddCommentToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column :beers, :comment, :text
  end
end
