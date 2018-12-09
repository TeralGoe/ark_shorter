require 'rails_helper'

RSpec.describe Visitor, type: :model do
  describe 'associations' do
    it { should belong_to(:shorter) }
  end

  describe 'validations' do
    specify do
      should validate_presence_of(:ip)
      should validate_presence_of(:country)
    end
  end
end
