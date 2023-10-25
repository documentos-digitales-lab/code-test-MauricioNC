FactoryBot.define do
  factory :invoice do
    amount { 1 }
    sub_total { 1 }
    tax { 1 }
    total { 1 }
    customer { nil }
  end
end
