module Api
  module V1
    # Controller for a  logical interface on a server like eth0
    # or Local Area Connection 1
    class InterfacesController < BaseController
      private

      def interface_params
        params.require(:interface).permit(:name, :port_id, :ipaddresses)
      end

      def query_params
        params.permit(:name, :port_id)
      end
    end
  end
end
