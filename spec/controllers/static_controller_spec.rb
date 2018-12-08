require 'rails_helper'

RSpec.describe 'Static controller', type: :request do
  describe 'GET /' do
    context 'when layout work fine' do
      before { get '/' }
      it 'show blank page' do
        expect(response.body).to include('a plan!')
      end
    end
  end
end
