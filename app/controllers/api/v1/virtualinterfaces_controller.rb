module Api
  module V1
    # Represents a virtual interface like Trunk1 or bond0 or dummy0
    class VirtualinterfacesController < BaseController
      private

      def virtualinterface_params
        params.require(:virtualinterface).permit(:name, :ipaddresses)
      end

      def query_params
        params.permit(:name, :interface_id)
      end
    end
  end
end
