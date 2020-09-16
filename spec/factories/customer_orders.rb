FactoryBot.define do
  factory :customer_order do
    token {"tok_72e6a0365993b1fdfe4b58fcd584"}
    postal_code {"123-4567"}
    shipping_origin_id {Faker::Number.between(from: 1, to: 49)}
    city {"横浜区"}
    house_number {"青山1-1-1"}
    building_name {"柳ビル103"}
    phone_number {Faker::Number.number(digits: 10)}
  end
end
