class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :start_date, :end_date, presence: true
  validate :date_cannot_be_in_the_past
  validate :start_must_be_before_end_time

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end

    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def start_must_be_before_end_time
    errors.add(:start_date, "must be before end time") unless
          start_date < end_date
  end
end
