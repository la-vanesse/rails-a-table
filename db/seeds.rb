# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "cleaning up database..."
Product.destroy_all
puts "Database cleaned"

product_1 = Product.create!(
  name: "Renaissance",
  description: "Steel cutlery with floral decorations",
  event_type: "Birthday",
  product_type: "Cutlery",
  user: "Alphonse",
  rating: 2,
  quantity: 48,
  price: 10)

product_2 = Product.create!(
  name: "Azalea",
  description: "Spice up the image of your dining table by opting for the gold-rimmed Verde dinner set. The vibrant jewel tones of gold and emerald green will make your meal presentation more exciting.",
  event_type: "Party",
  product_type: "Plate",
  user: "Gerald",
  rating: 5,
  quantity: 24,
  price: 15)

product_3 = Product.create!(
  name: "Venetto",
  description: "Steel cutlery with floral decorations",
  event_type: "wedding",
  product_type: "Glasses",
  user: "Alphonse",
  rating: 4,
  quantity: 48,
  price: 12)

product_4 = Product.create!(
  name: "Farfetch",
  description: "White, grey and blue Orquestra dinner plate from Vista Alegre featuring a geometric pattern, a round shape and a shallow design.",
  event_type: "Birthday",
  product_type: "Plate",
  user: "Jack32",
  rating: 1,
  quantity: 12,
  price: 14)

product_5 = Product.create!(
  name: "Franky",
  description: "Simplicity and utility in white stacking porcelain.",
  event_type: "christmas",
  product_type: "Set",
  user: "Alphonse",
  rating: 2,
  quantity: 24,
  price: 50)

product_6 = Product.create!(
  name: "Ikeha",
  description: "Make the most of them by serving up good food on this simple, timeless dinnerware.",
  event_type: "Party",
  product_type: "Plate",
  user: "Jessica",
  rating: 3,
  quantity: 12,
  price: 11)

product_7 = Product.create!(
  name: "Wahoo",
  description: "Serve Food in Different Style! Enhance the look of your dining table with this Designer Dinner Set, ideal for storing and serving needs.",
  event_type: "Birthday",
  product_type: "set",
  user: "Jojo",
  rating: 5,
  quantity: 24,
  price: 55)

product_8 = Product.create!(
  name: "Donald",
  description: "constructed by premium quality rust-resistant stainless steel, durable and healthy for everyday use, dishwasher safe.",
  event_type: "Wedding",
  product_type: "set",
  user: "Anick",
  rating: 5,
  quantity: 24,
  price: 45)

puts "created #{product.count} products"
puts "done"
