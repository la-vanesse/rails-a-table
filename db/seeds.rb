# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning up database..."
Product.destroy_all
User.destroy_all
puts "Database cleaned"

user_1 = User.create!(
  name: "Jack32",
  email: "Jack32@gmail.com",
  address: "Pamplemousses",
  phone: "7315558"
)

user_2 = User.create!(
  name: "Gerald",
  email: "gerald@gmail.com",
  address: "Chemin Grenier",
  phone: "7316558"
)

user_3 = User.create!(
  name: "Alphose",
  email: "alph@gmail.com",
  address: "Blue bay",
  phone: "7316548"
)

product_1 = Product.create!(
  name: "Renaissance",
  description: "Steel cutlery with floral decorations",
  event_type: "Birthday",
  product_type: "Cutlery",
  user_id: "3",
  price: 10,
  quantity: 48,
  is_booked: false
)

# product_1.photo.attach(io: file, filename: 'flowery cutlery.jpg', content_type: 'image/jpg')

product_2 = Product.create!(
  name: "Azalea",
  description: "Spice up the image of your dining table by opting for the gold-rimmed Verde dinner set. The vibrant jewel tones of gold and emerald green will make your meal presentation more exciting.",
  event_type: "Party",
  product_type: "Plate",
  user_id: "2",
  price: 15,
  quantity: 24,
  is_booked: true
)

# product_2.photo.attach(io: file, filename: 'gold-rimmed verde plates.jpg', content_type: 'image/jpg')

product_3 = Product.create!(
  name: "Venetto",
  description: "Steel cutlery with floral decorations",
  event_type: "wedding",
  product_type: "Glasses",
  user_id: "3",
  price: 12,
  quantity: 48,
  is_booked: false
)

# product_3.photo.attach(io: file, filename: 'crystal glass.jpg', content_type: 'image/jpg')

product_4 = Product.create!(
  name: "Farfetch",
  description: "White, grey and blue Orquestra dinner plate from Vista Alegre featuring a geometric pattern, a round shape and a shallow design.",
  event_type: "Birthday",
  product_type: "Plate",
  user_id: "1",
  price: 14,
  quantity: 12,
  is_booked: false
)

# product_4.photo.attach(io: file, filename: 'geometric dinner set', content_type: 'image/jpg')

puts "created #{Product.count} products"
puts "done"
