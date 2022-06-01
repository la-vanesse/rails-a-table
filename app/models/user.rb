class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, through: :bookings
  has_many :reviews, through: :products
  has_many :bookings
  has_many :products, dependent: :destroy
  has_many :bookings, dependent: :destroy

  # thanks to Cloudinary
  has_one_attached :photo

  # Added validations
  validates :name, presence: true, uniqueness: true
  validates :email, email: true, uniqueness: true
end
