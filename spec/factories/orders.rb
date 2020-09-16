FactoryBot.define do
  factory :order do
    association :customer
  end
end
