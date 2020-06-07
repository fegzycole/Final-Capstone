class Automobile < ApplicationRecord
  has_many :bookings
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :imageUrl, presence: true
end
