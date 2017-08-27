class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :country
      t.string :appellation
      t.integer :year
      t.string :color
      t.integer :stock
      t.integer :rating

      t.timestamps
    end
  end
end
