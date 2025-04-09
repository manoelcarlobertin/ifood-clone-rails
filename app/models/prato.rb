class Prato < ApplicationRecord
  belongs_to :restaurante

  has_many :orders, dependent: :destroy
  has_many :customers, through: :orders
end
