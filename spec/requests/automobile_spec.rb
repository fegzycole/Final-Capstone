require 'rails_helper'

RSpec.describe 'Automobiles API', type: :request do
  describe 'GET /api/v1/automobiles' do
    let(:user_params) do
      {
        user: {
          first_name: 'Ferguson', password: 'Fegzycole', email: 'fegzydomain@mail.com', last_name: 'Iyara'
        }
      }
    end

    before do
      post '/api/v1/auth/signup', params: user_params
      @token = json['token']
      @authorization = { Authorization: @token }
    end

    context 'valid request' do
      before { get '/api/v1/automobiles', headers: @authorization }

      it 'successfully returns a list of all automobiles' do
        expect(json.keys).to eql(%w[automobiles])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid request' do
      before { get '/api/v1/automobiles' }

      it 'successfully returns a list of all automobiles' do
        expect(json['errors']).to be_truthy
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
