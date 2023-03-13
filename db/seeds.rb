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
  elizabeth = { first_name: "eliza", last_name: "orji", age: 33},
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

# Account.create!(
#   account_type: account_types.sample,
#   account_name: random_names.sample,
#   balance: rand(1000),
#   account_number: rand(10000000..19999999),
#   user_id: user1.id
# )

# Account.create!(
#   account_type: account_types.sample,
#   account_name: random_names.sample,
#   balance: rand(1000),
#   account_number: rand(10000000..19999999),
#   user_id: user2.id
# )

# Account.create!(
#   account_type: account_types.sample,
#   account_name: random_names.sample,
#   balance: rand(1000),
#   account_number: rand(10000000..19999999),
#   user_id: user3.id
# )

# Account.create!(
#   account_type: account_types.sample,
#   account_name: random_names.sample,
#   balance: rand(1000),
#   account_number: rand(10000000..19999999),
#   user_id: user4.id
# )
# Account.create!(
#   account_type: account_types.sample,
#   account_name: random_names.sample,
#   balance: rand(1000),
#   account_number: rand(10000000..19999999),
#   user_id: user5.id
# )

crypto_guide = TopicMaterial.create(topic_name: "cryptocurrency")

LearningMaterial.create(title: "Crypto for dummies",
  description: "A short introduction to cryptocurrencies. Fully Idiot Proof.",
  topic_material_id: crypto_guide.id
)

long_term_investing = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "In it For the Long Run",
  description: " A detailed look into the intricacies of the stock market and how you can win over 5-10 years.",
  topic_material_id: long_term_investing.id
)

debt_management_plans = TopicMaterial.create(topic_name: "debt")


LearningMaterial.create(title: "Becoming Debt Free!",
  description: "An article about debt management plans and how you can use them to manage your debt...",
  topic_material_id: debt_management_plans.id
)


saving_principles = TopicMaterial.create(topic_name: "saving")

LearningMaterial.create(title: "12 principles
  for saving and investing",
  description: "an article about 12 principles for saving. a short guide.",
  topic_material_id: saving_principles.id
)

penny_stocks = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "What can I do With £50?",
  description: "An insight into the volatile world of penny stocks and the money you can make with just £50",
  topic_material_id: penny_stocks.id
)

banking = TopicMaterial.create(topic_name: "banking")

LearningMaterial.create(title: "Banking overview",
  description: "An overview of the Financial Services",
  topic_material_id: banking.id
)

indexes = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "How to retire at 40",
  description: "A quick look at how to compound your assets using indexes",
  topic_material_id: indexes.id
)

spending = TopicMaterial.create(topic_name: "spending")

LearningMaterial.create(title: "Best Ways to Spend Your Money in 2023",
  description: "No More Gadgets!!! This article gives you a look into the best things to spend money on in 2023",
  topic_material_id: spending.id
)

finlit = TopicMaterial.create(topic_name: "Tech")

LearningMaterial.create(title: "Investment apps you need in 2023",
  description: "A deep dive into the must-have finance apps in 2023 including a new high-flyer called FinLit",
  topic_material_id: finlit.id
)

stonks = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "Top 5 stocks to buy now",
  description: "A look at all the companies on the market with great fundamentals that will double your money in 2 years",
  topic_material_id: stonks.id
)



puts "finalize seeds"
