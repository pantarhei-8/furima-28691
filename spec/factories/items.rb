FactoryBot.define do
  factory :item do
    item_name              {Faker::Space.planet}
    item_text              {Faker::Lorem.sentence}
    category_id            {Faker::Number.between(from: 1, to: 12)}
    status_id              {Faker::Number.between(from: 1, to: 8)}
    shipping_charger_id    {Faker::Number.between(from: 1, to: 4)}
    shipping_origin_id     {Faker::Number.between(from: 1, to: 49)}
    days_until_shipping_id {Faker::Number.between(from: 1, to: 5)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
  end
end
