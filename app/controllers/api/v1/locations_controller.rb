module Api
  module V1
    # Controller for a physical location like a data centre or a room or rack
    class LocationsController < BaseController
      private

      def location_params
        params.require(:location).permit(:name, :parent_id)
      end

      def query_params
        params.permit(:name, :parent_id)
      end
    end
  end
end
