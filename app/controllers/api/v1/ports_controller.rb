module Api
  module V1
    # Controller for a physical port like what you plug cables into
    class PortsController < BaseController
      private

      def port_params
        params.require(:port).permit(:name, :porttype_id, :device_id)
      end

      def query_params
        params.permit(:name, :porttype_id, :device_id)
      end
    end
  end
end
