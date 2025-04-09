class CreatePratos < ActiveRecord::Migration[8.0]
  def change
    create_table :pratos do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :restaurante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
