require 'rails_helper'

RSpec.describe 'Web::Shorters controller', type: :request do
  let!(:shorter) { create :shorter }

  # New shorter
  describe 'GET /' do
    context 'when form exists' do
      before { get '/' }

      it 'includes new_shorter form id' do
        expect(response.body).to include('new_shorter')
      end
    end
  end

  # Shorter creation
  describe 'POST /' do
    context 'when the request is valid' do
      before { post '/', params: { shorter: { original_url: Faker::Internet.url } } }

      it 'creates a shorter' do
        expect(subject).to render_template('web/shorters/edit')
        expect(response.body)
          .to match(/Your link is shortened/)
      end
    end

    context 'when the request is invalid' do
      before { post '/', params: { shorter: { original_url: Faker::Books::Dune.planet } } }

      it 'returns a validation failure message' do
        expect(response).to redirect_to(root_path)
        follow_redirect!
        expect(response.body)
          .to match(/Oh no!/)
      end
    end
  end

  # Shorter redirection
  describe 'GET /:short_code' do
    context 'when the redirect is completed' do
      before { get "/#{shorter.code}" }

      it 'create a new visitor and redirect to url' do
        expect(Visitor.last.shorter).to eql(shorter)
        response.should redirect_to(shorter.original_url)
      end
    end

    context 'when the record does not exist' do
      before { get '/3.14' }

      it 'redirect to root' do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
