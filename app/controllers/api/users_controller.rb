module Api
  class UsersController < Api::BaseController
    before_filter :authenticate_request!

    def index
      render json: {'logged_in' => true}
    end

    private

      def user_params
        params.require(:user).permit(:name)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:user_id, :name)
      end

  end
end
