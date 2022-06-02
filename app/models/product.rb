class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  # Hack thanks to Cloudinary
  has_one_attached :photo

  # Added validations - don't hesitate to modify/correct it :)
  validates :name, presence: true, uniqueness: true
  validates :event_type, presence: true
  validates :product_type, inclusion: { in: %w[sets plates glasses cutleries],
    message: "%{value} is not a valid cutlery type" }
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  scope :plates, -> { where(product_type: "plates") }
  scope :cutleries, -> { where(product_type: "cutleries") }
  scope :glasses, -> { where(product_type: "glasses") }
end
