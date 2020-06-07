module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user.save
          data = get_data(@user)

          json_response(data, :ok)
        else
          json_response({ errors: @user.errors.full_messages },
                        :unprocessable_entity)
        end
      end

      def login
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])
          data = get_data(@user)

          json_response(data, :ok)
        else
          json_response({ error: 'Email or password incorrect' }, :unauthorized)
        end
      end

      private

      def user_params
        params[:user].permit(:first_name, :last_name, :email, :password)
      end
    end
  end
end
