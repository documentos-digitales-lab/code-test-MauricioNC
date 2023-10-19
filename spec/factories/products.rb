FactoryBot.define do
  factory :product do
    quantity { 1 }
    product { "MyString" }
    unit_price { 1 }
    sub_total { 1 }
  end
end
