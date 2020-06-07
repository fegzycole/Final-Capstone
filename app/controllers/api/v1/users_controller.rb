module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)

        if @user.save
          session[:user_id] = @user.id

          data = { id: session[:user_id], firstName: @user.first_name,
                   lastName: @user.last_name, email: @user.email }

          json_response(data, :ok)
        else
          json_response({ errors: @user.errors.full_messages },
                        :unprocessable_entity)
        end
      end

      private

      def user_params
        params[:user].permit(:first_name, :last_name, :email, :password)
      end
    end
  end
end
