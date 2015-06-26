module Api
  module V1
    # Controller for a type of cable like CAT6
    class CabletypesController < BaseController
      private

      def cabletype_params
        params.require(:porttype).permit(:name, :conn1_id, :conn2_id)
      end

      def query_params
        params.permit(:name, :conn1_id, :conn2_id)
      end
    end
  end
end
