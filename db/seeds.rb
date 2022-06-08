require "open-uri"
file = URI.open('https://res.cloudinary.com/djfn5ptcp/image/upload/v1654331223/yxqfhqx93v4znphoqm4c.jpg')

puts "cleaning up database..."
Review.destroy_all
Product.destroy_all
User.destroy_all

puts "Database cleaned"
pw = 123456

10.times do
  User.create!(
    name: Faker::Name.unique.name,
    username: Faker::Name.unique.name,
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
  username: "Ajaghen",
  name: "Ajaghen",
  email: "Ajaghen@test.com",
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

user_id_first = User.first.id
user_id_last = User.last.id

product1 = Product.create!(
  name: "Venice Cutlery",
  description: "Venice Cutlery Set will bring a luxurious tone of blush and gold to your home! ",
  event_type: "Posh dinners",
  product_type: "cutleries",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
file = URI.open('https://cdn.shopify.com/s/files/1/0088/8589/5225/products/HTB1_1ZsEx1YBuNjy1zcq6zNcXXaJ_0f72b47a-3339-4498-ad94-403847ebabd6_700x.jpg?v=1631028780')
product1.photo.attach(io: file, filename: 'golden cutlery.jpg', content_type: 'image/jpg')

product2 = Product.create!(
  name: "Azalea",
  description: "Spice up the image of your dining table by opting for the gold-rimmed Verde dinner set. The vibrant jewel tones of gold and emerald green will make your meal presentation more exciting.",
  event_type: "Party",
  product_type: "sets",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: true
)
file = URI.open('https://cdn.shopify.com/s/files/1/0051/4480/5448/products/product-image-725740050_720x.jpg?v=1557610482')
product2.photo.attach(io: file, filename: 'gold-rimmed verde plates.jpg', content_type: 'image/jpg')

product3 = Product.create!(
  name: "Bubbles",
  description: "Bubbled glass detail Electroplated gold rim Makes a great gift Twine crafts glassware ",
  product_type: "glasses",
  event_type: "Party",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
file = URI.open('https://secure.img1-cg.wfcdn.com/im/18136229/resize-h800-w800%5Ecompr-r85/7879/78797916/Seaside+Bubble+16+oz.+All+Purpose+Wine+Glass.jpg')
product3.photo.attach(io: file, filename: 'crystal glass.jpg', content_type: 'image/jpg')

product4 = Product.create!(
  name: "Farfetch",
  description: "The Bohemia crockery collection, with its charming designs in blue, white, and ochre.",
  event_type: "Party",
  product_type: "sets",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
file = URI.open('https://cdn.shopify.com/s/files/1/2690/0106/products/DSC08606_e92ed326-170f-4bc6-8685-ccda559a66e2_800x.jpg?v=1647694893')
product4.photo.attach(io: file, filename: 'bohemian dinner set', content_type: 'image/jpg')

product5 = Product.create!(
  name: "Charcoal",
  description: "Enhance your table setting with this textured black ceramic dinner plate. The texture enhances the look of any food you place on it, making it ideal for any meal",
  event_type: "Wedding",
  product_type: "plates",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
file = URI.open('https://cdn.shopify.com/s/files/1/2690/0106/products/texturedinnerplateblackempty_800x.jpg?v=1590836060')
product5.photo.attach(io: file, filename: 'charcoal dinner set', content_type: 'image/jpg')

product6 = Product.create!(
  name: "Halloween set",
  description: "Simplicity and utility in white stacking porcelain.",
  event_type: "Wedding",
  product_type: "sets",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: false
)
file = URI.open('https://darkdwelling.uk/dark-house/_img/halloween-plates-bowls-cups-melamine/HalloweenTablewareMelamine2.jpg')
product6.photo.attach(io: file, filename: 'halloween set', content_type: 'image/jpg')

product7 = Product.create!(
  name: "Banana leaves",
  description: "Natural material",
  event_type: "Wedding",
  product_type: "plates",
  user_id: rand(user_id_first..user_id_last),
  price: rand(5..50),
  quantity: rand(1..100),
  is_booked: true
)
file = URI.open('https://skytexthailand.com/wp-content/uploads/2017/10/MG_1019.jpg')
product7.photo.attach(io: file, filename: 'banana.jpg', content_type: 'image/jpg')

puts "> created #{Product.count} products"

product_id_first = Product.first.id
product_id_last = Product.last.id

40.times do
  Review.create!(
    rating: rand(1..5),
    comment: Faker::Lorem.sentence(word_count: rand(3..10)),
    user_id: rand(user_id_first..user_id_last),
    product_id: rand(product_id_first..product_id_last)
  )
end

puts "> Created #{Review.count} random reviews"

puts "> Done!"
