module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          token = JsonWebToken.encode(user_id: @user.id, isAdmin: @user.isAdmin)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                         id: @user.id, firstName: @user.firstName,
                         lastName: @user.lastName, email: @user.email }, status: :ok
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def login
        @user = User.find_by_email(params[:email])

        if @user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id, isAdmin: @user.isAdmin)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                         id: @user.id, firstName: @user.firstName,
                         lastName: @user.lastName, email: @user.email }, status: :ok
        else
          render json: { error: 'unauthorized' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.permit(:first_name, :last_name, :email, :password)
      end
    end
  end
end
