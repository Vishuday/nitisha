module Api
  module V1
    # Controller for a single IP address within a larger range
    class IpaddressesController < BaseController
      private

      def ipaddress_params
        params.require(:porttype).permit(:address, :parent_id, :interface_id)
      end

      def query_params
        params.permit(:address, :parent_id, :interface_id)
      end
    end
  end
end
