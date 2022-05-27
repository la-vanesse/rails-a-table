class User < ApplicationRecord
  has_many :products, through: :bookings
  has_many :reviews, throught: :products
  has_many :bookings
end
