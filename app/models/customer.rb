class Customer < ApplicationRecord
  has_many :products
  validates :rfc, presence: true
end
