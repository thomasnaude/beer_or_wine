class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :country
      t.string :style
      t.string :brewery

      t.timestamps
    end
  end
end
