module Api
  class DependentsController < Api::BaseController

    private

      def dependents_params
        params.require(:dependents).permit(:name)
      end

      def query_params
        params.permit(:name)
      end

  end
end