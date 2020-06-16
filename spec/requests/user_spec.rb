require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  describe 'POST /api/v1/auth/signup' do
    let(:user_params) do
      {
        user: {
          first_name: 'Ferguson', password: 'Fegzycole', email: 'fegzydomain@mail.com', last_name: 'Iyara'
        }
      }
    end
    let(:invalid_params) do
      {
        user: {
          first_name: 'Feg', email: 'fegzydoman@mail.com', last_name: 'Iy'
        }
      }
    end

    context 'valid request' do
      before { post '/api/v1/auth/signup', params: user_params }

      it 'successfully creates a new user' do
        expect(json.keys).to eql(%w[token exp])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid request' do
      before { post '/api/v1/auth/signup', params: invalid_params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns an array of errors' do
        expect(json['errors']).to eql([
                                        'Password can\'t be blank',
                                        'Password is too short (minimum is 6 characters)',
                                        'Last name is too short (minimum is 3 characters)'
                                      ])
      end
    end
  end

  describe 'POST /api/v1/auth/signin' do
    let(:user_params) do
      {
        user: {
          first_name: 'Ferguson', password: 'Fegzycole', email: 'fegzydomain@mail.com', last_name: 'Iyara'
        }
      }
    end

    before { post '/api/v1/auth/signup', params: user_params }

    let(:login_params) do
      {
        email: user_params[:user][:email], password: user_params[:user][:password]
      }
    end

    let(:invalid_params) do
      {
        email: user_params[:user][:email], password: 'fake_password12'
      }
    end

    context 'valid request' do
      before { post '/api/v1/auth/signin', params: login_params }

      it 'successfully signs in a user' do
        expect(json.keys).to eql(%w[token exp])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid request' do
      before { post '/api/v1/auth/signin', params: invalid_params }

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns an array of errors' do
        expect(json['error']).to eql('Email or password incorrect')
      end
    end
  end
end
