module Api
  module V1
    # Controller for a type of device like server or switch
    class DevicetypesController < BaseController
      private

      def devicetype_params
        params.require(:devicetype).permit(:name)
      end

      def query_params
        params.permit(:name)
      end
    end
  end
end
