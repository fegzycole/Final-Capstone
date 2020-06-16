class User < ApplicationRecord
  has_many :bookings
  has_secure_password
  before_save :downcase_email

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :last_name, presence: true, length: { minimum: 3 }

  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

  private

  def downcase_email
    email.downcase!
  end
end
