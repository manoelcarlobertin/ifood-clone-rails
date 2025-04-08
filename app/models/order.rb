class Order < ApplicationRecord
  belongs_to :restaurante
  has_many :order_products, dependent: :destroy

  # enum status: { waiting: 0, delivered: 1 }

  validates :name, presence: true
  validates :mobile_phone, presence: true
  validates :total_value, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: true
  validates :street, presence: true
  validates :number, presence: true
end
