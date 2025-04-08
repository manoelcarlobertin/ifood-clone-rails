class ProductCategory < ApplicationRecord
  belongs_to :restaurante
  has_many :products

  validates :title, presence: true
end
