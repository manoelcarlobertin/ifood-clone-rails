class CreateProductCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :product_categories do |t|
      t.string :title
      t.references :restaurante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
