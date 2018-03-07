require 'faker'

FactoryBot.define do
  factory :list do
    title Faker::Hipster.sentence(3)
    private false
    user
  end
end
