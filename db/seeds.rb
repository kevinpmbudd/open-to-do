require 'faker'

3.times do
  pw = Faker::Internet.password(8)
  User.create!(
    name: Faker::Pokemon.unique.name,
    email: Faker::Internet.unique.email,
    password: pw,
    password_confirmation: pw,
  )
end

User.create!(
  name: 'kevin',
  email:'kevin@kevinbudd.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
users = User.all

12.times do
  List.create!(
    title: Faker::Hipster.sentence(3),
    user: users.sample
  )
end

lists = List.all

36.times do
  Item.create!(
    description: Faker::Hipster.word,
    list: lists.sample
  )
end

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} items created"
