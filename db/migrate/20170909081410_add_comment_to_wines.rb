class AddCommentToWines < ActiveRecord::Migration[5.0]
  def change
    add_column :wines, :comment, :text
  end
end
