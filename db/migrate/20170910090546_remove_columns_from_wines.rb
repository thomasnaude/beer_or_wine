class RemoveColumnsFromWines < ActiveRecord::Migration[5.0]
  def change
    remove_column :wines, :year, :integer
    remove_column :wines, :stock, :integer
  end
end
