module Api
  module V1
    # Controller for members of a virtual interface
    # like eth0 & eth1 are in bond0
    class VifmembersController < BaseController
      private

      def vifmember_params
        params.require(:virtualinterface).permit(:interface_id,
                                                 :virtualinterface_id)
      end

      def query_params
        params.permit(:interface_id, :virtualinterface_id)
      end
    end
  end
end
