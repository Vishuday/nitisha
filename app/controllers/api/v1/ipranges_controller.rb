module Api
  module V1
    # Controller for a range of IP addresses like 10.0.0.0/8
    class IprangesController < BaseController
      private

      def iprange_params
        params.require(:porttype).permit(:description, :address,
                                         :prefix, :parent_id)
      end

      def query_params
        params.permit(:name, :address, :prefix, :parent_id)
      end
    end
  end
end
