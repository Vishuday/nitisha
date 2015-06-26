module Api
  module V1
    # Controller for a connection between two ports
    class ConnectionsController < BaseController
      private

      def connection_params
        params.require(:connection).permit(:porta_id, :portb_id, :cabletype_id)
      end

      def query_params
        params.permit(:porta_id, :portb_id, :cabletype_id)
      end
    end
  end
end
