class Product < ApplicationRecord
  belongs_to :customer
  validates :quantity, :product, :unit_price, :amount, presence: true
end
