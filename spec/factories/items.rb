require 'faker'

FactoryBot.define do
  factory :item do
    description Faker::Hipster.word
    list
  end
end
