require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    email = (0..26).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should allow_value('fegzycole').for(:first_name) }
    it { should allow_value('fegzycole').for(:last_name) }
    it { should_not allow_value('fe').for(:first_name) }
    it { should_not allow_value('fe').for(:last_name) }
    it { should_not allow_value(email).for(:email) }

    it { should have_many(:bookings)}
  end
end