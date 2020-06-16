require 'rails_helper'

RSpec.describe 'Bookingss API', type: :request do
  def create_automobile
    Automobile.create!(name: 'Vespa Gts 300 Ie Abs',
                       description: 'Navigate through the rocky terrain with style',
                       imageUrl: 'https://www.vhv.rs/dpng/d/315-3153674_gtv-300-i-vespa-gts-300-ie-abs.png')
  end

  let(:user_params) do
    {
      user: {
        first_name: 'Ferguson', password: 'Fegzycole', email: 'fegzydomain@mail.com', last_name: 'Iyara'
      }
    }
  end

  let(:booking_params) do
    {
      booking: {
        date: '2020-06-07T10:43:10.528Z',
        notes: 'Something to add',
        city: 'Chicago',
        automobile_id: @automobile.id
      }
    }
  end

  let(:invalid_params) do
    {
      booking: {
        date: '2020-06-07T10:43:10.528Z',
        automobile_id: @automobile.id
      }
    }
  end

  describe 'GET /api/v1/automobiles' do
    before do
      @automobile = create_automobile
      post '/api/v1/auth/signup', params: user_params
      @token = json['token']
      @authorization = { Authorization: @token }
      post '/api/v1/bookings', params: booking_params, headers: @authorization
    end

    context 'valid request' do
      before { get '/api/v1/bookings', headers: @authorization }

      it 'successfully returns a list of a user\'s bookings' do
        expect(json.keys).to eql(%w[bookings])
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid request' do
      before { get '/api/v1/bookings' }

      it 'successfully returns a list of all automobiles' do
        expect(json['errors']).to be_truthy
      end

      it 'returns status code 401' do
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'POST /api/v1/bookings' do
    before(:each) do
      @automobile = create_automobile
      post '/api/v1/auth/signup', params: user_params
      @token = json['token']
      @authorization = { Authorization: @token }
    end

    context 'valid request' do
      before { post '/api/v1/bookings', params: booking_params, headers: @authorization }

      it 'successfully creates a new booking' do
        expect(json.keys).to eql(%w[message])
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid request' do
      before { post '/api/v1/bookings', params: invalid_params, headers: @authorization }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns an array of errors' do
        expect(json['errors']).to eql(['City can\'t be blank'])
      end
    end
  end
end
