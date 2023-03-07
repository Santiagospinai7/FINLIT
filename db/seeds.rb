# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Account.destroy_all
User.destroy_all

puts "create owners data"
owners = [
  max = { first_name: "max", last_name: "whitehead", age: 22},
  elizableth = { first_name: "eliza", last_name: "orji", age: 33},
  amir = { first_name: "amir", last_name: "abdel nour", age: 23},
  tim = { first_name: "tim", last_name: "popoola", age: 22},
  santiago = { first_name: "santiago", last_name: "ospina", age: 21}
]

puts "creating users"

owners.each do |owner|
  User.create!(
    first_name: owner[:first_name],
    last_name: owner[:last_name],
    password: '123456',
    email: "#{owner[:first_name]}@finlit.dev"
  )
end
user1 = User.create!(
  first_name: "Thiago",
  last_name: "silva",
  password: '123456',
  email: "thiagosilva@finlit.dev"
)

user2 = User.create!(
  first_name: "Luka",
  last_name: "Modric",
  password: '123456',
  email: "lukamodric@finlit.dev"
)

user3 = User.create!(
  first_name: "Toni",
  last_name: "Kroos",
  password: '123456',
  email: "tonikroos@finlit.dev"
)

user4 = User.create!(
  first_name: "Classy",
  last_name: "Casemiro",
  password: '123456',
  email: "classycasemiro@finlit.dev"
)

user5 = User.create!(
  first_name: "Luka",
  last_name: "Doncic",
  password: '123456',
  email: "Lukadoncic@finlit.dev"
)

puts "users created"

account_types = ["current", "savings", "student"]
random_names = ["Bestie", "BFF", "Queen", "Senorita", "Girly", "Gal", "Friend", "Forever", "Soul Sister", "Sis", "Chica", "Missy", "Ride or die", "Homegirl"]

Account.create!(
  account_type: account_types.sample,
  account_name: random_names.sample,
  balance: rand(1000),
  account_number: rand(10000000..19999999),
  user_id: user1.id
)

Account.create!(
  account_type: account_types.sample,
  account_name: random_names.sample,
  balance: rand(1000),
  account_number: rand(10000000..19999999),
  user_id: user2.id
)

Account.create!(
  account_type: account_types.sample,
  account_name: random_names.sample,
  balance: rand(1000),
  account_number: rand(10000000..19999999),
  user_id: user3.id
)

Account.create!(
  account_type: account_types.sample,
  account_name: random_names.sample,
  balance: rand(1000),
  account_number: rand(10000000..19999999),
  user_id: user4.id
)
Account.create!(
  account_type: account_types.sample,
  account_name: random_names.sample,
  balance: rand(1000),
  account_number: rand(10000000..19999999),
  user_id: user5.id
)
puts "finalize seeds"
