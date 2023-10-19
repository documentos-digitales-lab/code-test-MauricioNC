class Product < ApplicationRecord
  belongs_to :customer
  validates :quantity, :product, :unit_price, :sub_total, presence: true
end
