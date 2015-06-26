
module Api
  module V1
    # Controller for an asset which is something that has a serial
    # number mostly
    class AssetsController < BaseController
      private

      def asset_params
        params.require(:asset).permit(:serial, :description)
      end

      def query_params
        params.permit(:serial, :created_at, :updated_at)
      end
    end
  end
end
