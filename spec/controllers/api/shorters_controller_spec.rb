require 'rails_helper'

RSpec.describe 'Api::Shorters controller', type: :request do
  let!(:shorters) { create_list :shorter, 5 }
  let!(:visitors) { create_list :visitor, 5, shorter: shorters.first }

  # List of shorters
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

  # Shorter creation
  describe 'POST /api/shorters' do
    let(:shorter) { { original_url: 'https://github.com/TeralGoe/ark_shorter' } }

    context 'when the request is valid' do
      before { post '/api/shorters', params: { shorter: shorter } }

      it 'creates a shorter' do
        expect(json['purified_url']).to eq('github.com/teralgoe/ark_shorter')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/shorters', params: { shorter: { original_url: Faker::Witcher.location } } }

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/is invalid/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
