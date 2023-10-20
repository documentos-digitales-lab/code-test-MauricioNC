class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_products
  has_many :products, through: :invoice_products
  validates :sub_total, :tax, :total, presence: true
end
