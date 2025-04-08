class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile_phone
      t.float :total_value
      t.string :city
      t.string :neighborhood
      t.string :number
      t.string :complement
      t.integer :status, default: 0
      t.references :restaurante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
