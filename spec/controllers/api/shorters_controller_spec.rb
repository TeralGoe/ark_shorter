require 'rails_helper'

RSpec.describe 'Api::Shorters controller', type: :request do
  let!(:shorters) { create_list :shorter, 5 }
  let!(:visitors) { create_list :visitor, 5, shorter: shorters.first }

  describe 'GET /api/shorters' do
    before { get '/api/shorters' }

    it 'returns shorters' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns correct status code' do
      expect(response).to have_http_status(200)
    end

    it 'includes the related objects' do
      expect(json[0]['visitors'].size).to eq(5)
    end
  end
end
