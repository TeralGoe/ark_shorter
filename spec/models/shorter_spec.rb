require 'rails_helper'

RSpec.describe Shorter, type: :model do
  describe 'associations' do
    it { should have_many(:visitors).dependent(:destroy) }
  end

  describe 'validations' do
    specify do
      should validate_presence_of(:original_url)
      should allow_value(Faker::Internet.url).for(:original_url)
    end
  end
end
