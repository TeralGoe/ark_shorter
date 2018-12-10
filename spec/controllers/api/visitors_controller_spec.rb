require 'rails_helper'

RSpec.describe 'Api::Visitors controller', type: :request do
  let!(:shorter) { create :shorter }
  let!(:visitors) { create_list :visitor, 5, shorter: shorter }

  # List of visitors
  describe 'GET /api/visitors' do
    before { get '/api/visitors' }

    context 'when visitors exists' do
      it 'returns visitors' do
        expect(json.size).to eq(5)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
