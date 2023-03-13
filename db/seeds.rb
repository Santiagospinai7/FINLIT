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

puts "creating learning materials"

crypto_guide = TopicMaterial.create(topic_name: "cryptocurrency")

LearningMaterial.create(title: "Crypto for dummies",
  description: "A short introduction to cryptocurrencies. Fully Idiot Proof.",
  topic_material_id: crypto_guide.id,
  explanation: "a digital currency in which transactions are verified and records maintained by a decentralized system using cryptography, rather than by a centralized authority.",
)

investment = TopicMaterial.create(topic_name: "investments")

LearningMaterial.create(title: "In it For the Long Run",
  description: " A detailed look into the intricacies of the stock market and how you can win over 5-10 years.",
  topic_material_id: investment.id,
  explanation: "Higher returns from the markets can never be guaranteed. But a long-term approach should give your investments time to adjust to market highs and lows and ultimately deliver positive growth with a chance of beating inflation in the process.",
)

debt_management_plans = TopicMaterial.create(topic_name: "debt")


LearningMaterial.create(title: "Becoming Debt Free!",
  description: "An article about debt management plans and how you can use them to manage your debt...",
  topic_material_id: debt_management_plans.id,
  explanation: "A Debt Management Plan is an agreement between you and your creditors to pay all of your debts. Debt management plans are usually used when either: you can only afford to pay creditors a small amount each month. you have debt problems but will be able to make repayments in a few months.",
)


saving_principles = TopicMaterial.create(topic_name: "saving")

LearningMaterial.create(title: "12 principles
  for saving and investing",
  description: "an article about 12 principles for saving. a short guide.",
  topic_material_id: saving_principles.id,
  explanation: "",

)

LearningMaterial.create(title: "What can I do With £50?",
  description: "An insight into the volatile world of penny stocks and the money you can make with just £50",
  topic_material_id: investment.id,
  explanation: "Saving means not spending a portion of your
  income, in other words putting some money aside.
  Your money is therefore safe and available, but
  its value decreases each year by the level of inflation",
)

banking = TopicMaterial.create(topic_name: "banking")

LearningMaterial.create(title: "Banking overview",
  description: "An overview of the Financial Services",
  topic_material_id: banking.id,
  explanation: "The economy is made up of many different segments called sectors. These sectors are comprised of different businesses that provide goods and services to consumers. The variety of services offered by lending institutions, brokerage firms, and other businesses are collectively referred to as the financial services sector.",
)

LearningMaterial.create(title: "How to retire at 40",
  description: "A quick look at how to compound your assets using indexes",
  topic_material_id: investment.id,
  explanation: "Most experts agree that index funds are very good investments for long-term investors. They are low-cost options for obtaining a well-diversified portfolio that passively tracks an index.",
)

spending = TopicMaterial.create(topic_name: "spending")

LearningMaterial.create(title: "Best Ways to Spend Your Money in 2023",
  description: "No More Gadgets!!! This article gives you a look into the best things to spend money on in 2023",
  topic_material_id: spending.id,
  explanation: "It's easy to fall into the habit of buying expensive coffee every day. Many of us eat out or order in every day, and we've all bought groceries that we've ended up throwing out.",
)

finlit = TopicMaterial.create(topic_name: "Tech")

LearningMaterial.create(title: "Investment apps you need in 2023",
  description: "A deep dive into the must-have finance apps in 2023 including a new high-flyer called FinLit",
  topic_material_id: finlit.id,
  explanation: "A  personal finance app can help track your spending, saving, investing, and bill payments while keeping you updated on credit score changes. You can connect personal finance apps to your financial institutions to see where the money from your bank account is being spent.",
)

tech = TopicMaterial.create(topic_name: "Tech")

LearningMaterial.create(title: "Next-Gen banking",
  description: "Looking into the future of banking",
  topic_material_id: tech.id,
  explanation: " Globally, banking is a sector that has grappled with technology.
  Despite hefty investments, banks of all kinds have struggled to leverage technology to their full advantage, falling short against the expectations of today’s digitally-savvy customers.",
)

tech2 = TopicMaterial.create(topic_name: "Tech")

LearningMaterial.create(title: "Future of FinTech",
  description: "Exploring the future of FinTech",
  topic_material_id: tech.id,
  explanation: "FinTechs are disrupting established markets and creating an uproar with customer-friendly solutions. According to McKinsey, technologies such as AI, Blockchain, Cloud, and IoT will drive business model reinventions",
)

tech3 = TopicMaterial.create(topic_name: "Tech")

LearningMaterial.create(title: "Impact of tech in Banking",
  description: "having a Detailed Look at the Impact of Tech in Banking",
  topic_material_id: tech.id,
  explanation: "The impact of technology on the banking industry is manifold and can be witnessed with the speed at which banks operate in the country today",
)

banking = TopicMaterial.create(topic_name: "banking")

LearningMaterial.create(title: "types of retail banking",
  description: "overview of the types of retail banks",
  topic_material_id: banking.id,
  explanation: "Retail banking, also known as consumer banking or personal banking, is banking that provides financial services to individual consumers rather than businesses.",
)



LearningMaterial.create(title: "types of retail banking",
  description: "overview of commercial banking",
  topic_material_id: banking.id,
  explanation: "A commercial bank is a financial institution that provides services like loans, certificates of deposits, savings bank accounts bank overdrafts, etc. to its customers",
)



LearningMaterial.create(title: "investment banking",
  description: "overview of investment banking",
  topic_material_id: banking.id,
  explanation: "Investment banking deals primarily with raising money for companies, governments, and other entities. Investment banking activities include underwriting new debt and equity securities for all types of corporations.",
)

puts "learning materials created"



puts "finalize seeds"
