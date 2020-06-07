require 'rails_helper'

RSpec.describe Automobile, type: :model do
  describe 'Automobile' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:imageUrl) }
    it { should allow_value('Vespa').for(:name) }
    it { should_not allow_value('V').for(:name) }
    it { should allow_value('Vespa').for(:description) }
    it { should_not allow_value('V').for(:description) }

    it { should have_many(:bookings)}
  end
end
