# frozen_string_literal: true
module API
  module V1
    class PingsController < API::V1::ApplicationController
      def create
        render_error!(
          :unprocessable_entity,
          error_type: :missing_message,
          error_message: "You must include a 'message' property in your ping request."
        ) if ping_params[:message].blank?

        render json: { message: ping_params[:message] }
      end

      private

      def ping_params
        params.permit(ping: [:message])[:ping] || {}
      end
    end
  end
end
