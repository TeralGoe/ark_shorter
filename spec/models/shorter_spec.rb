require 'rails_helper'

RSpec.describe Shorter, type: :model do
  let(:shorter) { create :shorter, original_url: 'https://github.com/TeralGoe' }

  describe 'associations' do
    it { should have_many(:visitors).dependent(:destroy) }
  end

  describe 'validations' do
    specify do
      should validate_presence_of(:original_url)
      should allow_value(Faker::Internet.url).for(:original_url)
    end
  end

  describe '#purifying' do
    context 'when url is purified' do
      it 'returns url' do
        expect(shorter.purified_url).to eq('github.com/teralgoe')
      end
    end
  end

  describe '#check_for_duplicates' do
    let(:dublicate) { create :shorter }
    context 'when duplicate exists' do
      it 'returns himself' do
        expect(dublicate.check_for_duplicates).to eq(dublicate)
      end
    end
  end

  describe 'callbacks' do
    it { should callback(:generate_data).before(:create) }
  end
end
