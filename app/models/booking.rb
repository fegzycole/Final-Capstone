class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :automobile

  validates :date, presence: true
  validates :notes, length: { maximum: 255 }
end
