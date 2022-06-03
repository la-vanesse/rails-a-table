puts "cleaning up database..."
Product.destroy_all
User.destroy_all
puts "Database cleaned"

pw = 123456

10.times do
  User.create!(
    username: Faker::Name.unique.name,
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    address: Faker::Address.full_address,
    password: pw
  )
end
puts "> created #{User.count} users"

# Demo users
User.create!(
  username: "cedric",
  name: "Cedric",
  email: "Cedric@test.com",
  address: "R.hill, 12, Paris",
  phone: "51234567",
  password: pw
)
User.create!(
  username: "Ajagen",
  name: "Ajagen",
  email: "Ajagen@test.com",
  address: "R.hill, 12, Paris",
  phone: "51234567",
  password: pw
)
User.create!(
  username: "Karishma",
  name: "Karishma",
  email: "Karishma@test.com",
  address: "R.hill, 12, Paris",
  phone: "7315558",
  password: pw
)

User.create!(
  username: "Vanessa",
  name: "Vanessa",
  email: "Vanessa@test.com",
  address: "Curepipe, Mauritius",
  phone: "7315558",
  password: pw
)

Product.create!(
  name: "Renaissance",
  description: "Steel cutlery with floral decorations",
  event_type: "Birthday",
  product_type: "Cutlery",
  user_id: rand(1..10),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)

# product_1.photo.attach(io: file, filename: 'flowery cutlery.jpg', content_type: 'image/jpg')

Product.create!(
  name: "Azalea",
  description: "Spice up the image of your dining table by opting for the gold-rimmed Verde dinner set. The vibrant jewel tones of gold and emerald green will make your meal presentation more exciting.",
  event_type: "Party",
  product_type: "Plate",
  user_id: rand(1..10),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: true
)

# product_2.photo.attach(io: file, filename: 'gold-rimmed verde plates.jpg', content_type: 'image/jpg')

Product.create!(
  name: "Venetto",
  description: "Steel cutlery with floral decorations",
  event_type: "wedding",
  product_type: "Glasses",
  user_id: rand(1..10),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)

# product_3.photo.attach(io: file, filename: 'crystal glass.jpg', content_type: 'image/jpg')

Product.create!(
  name: "Farfetch",
  description: "White, grey and blue Orquestra dinner plate from Vista Alegre featuring a geometric pattern, a round shape and a shallow design.",
  event_type: "Birthday",
  product_type: "Plate",
  user_id: rand(1..10),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
# product_4.photo.attach(io: file, filename: 'geometric dinner set', content_type: 'image/jpg')

# 15.times do
#   Product.create!(
#     name: Faker::Food.dish,
#     description: Faker::Food.description,
#     event_type: Faker::Food.spice,
#     product_type: Faker::Food.ingredient,
#     user_id: rand(1..10),
#     price: rand(5..50),
#     quantity: rand(1..100),
#     is_booked: false
#   )
# end

puts "> created #{Product.count} products"

40.times do
  Review.create!(
    rating: rand(1..5),
    comment: Faker::Lorem.sentence(word_count: rand(3..10)),
    user_id: rand(1..10),
    product_id: rand(1..4)
  )
end

puts "> Created #{Review.count} random reviews"

puts "> Done!"
