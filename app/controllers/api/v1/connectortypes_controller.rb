module Api
  module V1
    # Controller for a type of connector like RJ45
    class ConnectortypesController < BaseController
      private

      def connectortype_params
        params.require(:connectortype).permit(:name)
      end

      def query_params
        params.permit(:name)
      end
    end
  end
end
