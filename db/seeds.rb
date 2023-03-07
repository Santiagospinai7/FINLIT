# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "create owners data"
owners = [
  max = { first_name: "max", last_name: "whitehead", age: 22},
  elizableth = { first_name: "eliza", last_name: "orji", age: 33},
  amir = { first_name: "amir", last_name: "abdel nour", age: 23},
  tim = { first_name: "tim", last_name: "popoola", age: 22},
  santiago = { first_name: "santiago", last_name: "ospina", age: 21} 
]



owners.each do |owner|
  User.create!( 
    first_name: owner[:first_name],
    last_name: owner[:last_name],
    password: '123456',
    email: "#{owner[:first_name]}@finlit.dev",
  )
end

puts "finalize seeds"
