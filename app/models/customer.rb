class Customer < ApplicationRecord
  has_many :products
  has_many :invoices
  validates :rfc, presence: true
end
