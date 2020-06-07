# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post '/auth/signup', to: 'users#create'
      post '/auth/signin', to: 'users#login'
      get '/automobiles', to: 'automobiles#index'
    end
  end
end