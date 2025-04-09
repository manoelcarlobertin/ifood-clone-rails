class Restaurante < ApplicationRecord
  belongs_to :category

  has_many :product_categories
  has_many :orders
  has_many :pratos

  validates :name, :delivery_tax, :city, :neighborhood, :street, :number, presence: true
end
