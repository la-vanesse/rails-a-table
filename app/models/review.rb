class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # Validations added
  validates :comment, presence: true, length: { minimum: 5 }
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
