module Api
  module V1
    class AutomobilesController < ApplicationController
      before_action :authorize_request

      def index
        @automobiles = Automobile.all

        data = { automobiles: @automobiles }

        json_response(data, :ok)
      end
    end
  end
end
