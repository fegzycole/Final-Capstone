module Api
  module V1
    class BookingsController < ApplicationController
      before_action :authorize_request

      def create
        @booking = Booking.new(booking_params)
        @booking.user_id = @current_user.id

        if @booking.save
          data = { message: 'Booking successful' }

          json_response(data, :ok)
        else
          json_response({ errors: @booking.errors.full_messages },
                        :unprocessable_entity)
        end
      end


      private

      def booking_params
        params[:booking].permit(:date, :notes, :city, :automobile_id)
      end
    end
  end
end
