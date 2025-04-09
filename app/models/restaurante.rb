class Restaurante < ApplicationRecord
  belongs_to :category

  has_many :product_categories
  has_many :orders, dependent: :destroy
  has_many :pratos, dependent: :destroy

  validates :name, :delivery_tax, :city, :neighborhood, :street, :number, presence: true

  has_one_attached :image
end
