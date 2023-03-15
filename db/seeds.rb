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
puts "users created"

puts "create icons"
incons = ["saving_icon", "wallet_icon", "icon_1", "icon_2", "icon_3", "icon_4"]
incons.each do |icon|
  Icon.create(url: icon)
end

puts "icons created"

crypto_guide = TopicMaterial.create(topic_name: "cryptocurrency")

LearningMaterial.create(title: "Crypto for dummies",
  description: "A short introduction to cryptocurrencies. Fully Idiot Proof.",
  topic_material_id: crypto_guide.id
)

investment = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "In it For the Long Run",
  description: " A detailed look into the intricacies of the stock market and how you can win over 5-10 years.",
  topic_material_id: investment.id
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

LearningMaterial.create(title: "What can I do With £50?",
  description: "An insight into the volatile world of penny stocks and the money you can make with just £50",
  topic_material_id: investment.id
)

banking = TopicMaterial.create(topic_name: "banking")

LearningMaterial.create(title: "Banking overview",
  description: "An overview of the Financial Services",
  topic_material_id: banking.id
)

LearningMaterial.create(title: "How to retire at 40",
  description: "A quick look at how to compound your assets using indexes",
  topic_material_id: investment.id
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

LearningMaterial.create(title: "Top 5 stocks to buy now",
  description: "A look at all the companies on the market with great fundamentals that will double your money in 2 years",
  topic_material_id: investment.id
)

puts "finalize seeds"
