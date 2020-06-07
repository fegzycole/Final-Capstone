require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'Booking' do
    notes = (0..256).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:city) }
    it { should allow_value('Arriving with two others').for(:notes) }
    it { should_not allow_value(notes).for(:notes) }

    it { should belong_to(:user)}
    it { should belong_to(:automobile)}
  end
end
