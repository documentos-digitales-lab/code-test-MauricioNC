class Product < ApplicationRecord
  validates :quantity, :product, :unit_price, :sub_total, presence: true
end
