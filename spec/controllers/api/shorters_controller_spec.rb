require 'rails_helper'

RSpec.describe 'Api::Shorters controller', type: :request do
  let!(:shorters) { create_list :shorter, 5 }
  let!(:visitors) { create_list :visitor, 5, shorter: shorters.first }
  let(:shorter_code) { shorters.last.code }

  # List of shorters
  describe 'GET /api/shorters' do
    before { get '/api/shorters' }

    context 'when shorters exists' do
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

  # Shorter showing
  describe 'GET /api/shorters/:code' do
    before { get "/api/shorters/#{shorter_code}" }

    context 'when the record exists' do
      it 'returns the shorter' do
        expect(json).not_to be_empty
        expect(json['code']).to eq(shorter_code)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:shorter_code) { '3.14' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Shorter/)
      end
    end
  end
end
