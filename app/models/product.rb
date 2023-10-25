class Product < ApplicationRecord
  belongs_to :customer
  has_many :invoice_products
  has_many :invoices, through: :invoice_products
  validates :quantity, :product, :unit_price, :amount, presence: true
end
