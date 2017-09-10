class CreateVintages < ActiveRecord::Migration[5.0]
  def change
    create_table :vintages do |t|
      t.integer :year
      t.integer :stock
      t.references :wine, foreign_key: true

      t.timestamps
    end
  end
end
