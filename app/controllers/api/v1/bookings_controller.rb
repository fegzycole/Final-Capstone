module Api
  module V1
    class BookingsController < ApplicationController
      before_action :authorize_request

      def create
        @booking = Booking.new(booking_params)
        @booking.user_id = @current_user.id

        if Booking.exists(params[:booking][:automobile_id],
                          params[:booking][:date], params[:booking][:city]).length.positive?
          json_response({ error: 'You can not book this automobile at the specified date and city' },
                        :unprocessable_entity)
        elsif @booking.save
          data = { message: 'Booking successful' }

          json_response(data, :ok)
        else
          json_response({ errors: @booking.errors.full_messages },
                        :unprocessable_entity)
        end
      end

      def index
        @bookings = Booking.my_bookings(@current_user.id)

        data = { bookings: @bookings }

        json_response(data, :ok)
      end

      private

      def booking_params
        params[:booking].permit(:date, :notes, :city, :automobile_id)
      end
    end
  end
end
