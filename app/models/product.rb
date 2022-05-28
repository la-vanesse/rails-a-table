class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # Hack thanks to Cloudinary
  has_many_attached :photos

  # Added validations - don't hesitate to modify/correct it :)
  validates :name, presence: true, uniqueness: true
  validates :event_type, presence: true
  validates :product_type, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
