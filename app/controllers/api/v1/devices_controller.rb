module Api
  module V1
    # Controller for devices which represent a physical item like a switch
    # or a server
    class DevicesController < Api::V1::BaseController
      private

      def device_params
        params.require(:device).permit(:name, :description, :devicetype_id,
                                       :asset_id, :location_id, :ports)
      end

      def query_params
        params.permit(:name, :devicetype_id, :asset_id, :location_id)
      end
    end
  end
end
