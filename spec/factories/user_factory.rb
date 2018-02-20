FactoryGirl.define do
  factory :user do
    sequence(:login) { |_n| Faker::Name.unique.name }
  end
end