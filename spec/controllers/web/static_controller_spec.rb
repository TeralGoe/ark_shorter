require 'rails_helper'

RSpec.describe 'Web::Static controller', type: :request do
  describe 'GET /docs' do
    context 'when layout work fine' do
      before { get '/docs' }
      it 'show blank page' do
        expect(response.body).to include('a plan!')
      end
    end
  end
end
