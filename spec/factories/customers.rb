FactoryBot.define do
  factory :customer do
    association :user
    association :item
  end
end
