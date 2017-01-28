module Api
  class DependentsController < Api::BaseController
    before_filter :authenticate_request!

    def index
      render json: {'logged_in' => true}
    end

    private

      def dependents_params
        params.require(:dependents).permit(:name)
      end

      def query_params
        params.permit(:name)
      end

  end
end