module Api
  class UsersController < Api::BaseController

    private

      def dependents_params
        params.require(:dependents).permit(:name)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:user_id, :name)
      end

  end
end
