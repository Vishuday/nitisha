module Api
  module V1
    # Controller for a porttype like RJ45
    class PorttypesController < BaseController
      private

      def porttype_params
        params.require(:porttype).permit(:name, :connectortype_id)
      end

      def query_params
        params.permit(:name, :connectortype_id)
      end
    end
  end
end
