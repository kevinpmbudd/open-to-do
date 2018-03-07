require 'faker'

FactoryBot.define do
  pw = Faker::Internet.password(8)
  factory :user do
    name Faker::Pokemon.unique.name
    sequence(:email){|n| "user#{n}@open_to_do_factory.io" }
    password pw
    password_confirmation pw
  end
end
