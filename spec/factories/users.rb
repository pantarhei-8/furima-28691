FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials}
    email                   {Faker::Internet.free_email}
    password                {"123abc"}
    password_confirmation   {password}
    first_name              {"野菜"}
    name                    {"太郎"}
    first_name_reading      {"ヤサイ"}
    name_reading            {"ジロウ"}
    birth                   {"2000-2-20"}
  end
end
