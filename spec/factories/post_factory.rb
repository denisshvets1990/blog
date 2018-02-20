FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    title { Faker::Hipster.sentence }
    description { Faker::Hipster.paragraph }
  end
end