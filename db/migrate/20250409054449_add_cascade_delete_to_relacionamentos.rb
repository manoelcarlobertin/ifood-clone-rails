class AddCascadeDeleteToRelacionamentos < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :pratos, :restaurantes
    remove_foreign_key :orders, :restaurantes

    add_foreign_key :pratos, :restaurantes, on_delete: :cascade
    add_foreign_key :orders, :restaurantes, on_delete: :cascade
  end
end
