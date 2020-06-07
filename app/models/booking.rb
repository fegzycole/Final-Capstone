class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :automobile

  validates :date, presence: true
  validates :city, presence: true
  validates :notes, length: { maximum: 255 }

  def self.my_bookings(id)
    Booking.where(user_id: id).order(created_at: :desc)
  end

  def self.exists(automobile_id, date, city)
    Booking.where(automobile_id: automobile_id).where(date: date).where(city: city)
  end
end
