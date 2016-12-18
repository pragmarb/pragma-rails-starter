# frozen_string_literal: true
module API
  module V1
    class ConfirmationsController < ApplicationController
      def create
        if params[:email].blank?
          render_error!(
            :unprocessable_entity,
            error_type: :missing_email,
            error_message: 'You must provide an email to confirm.'
          )
        end

        User.send_confirmation_instructions(email: params[:email])

        head :no_content
      end

      def complete
        user = User.confirm_by_token(params[:id])

        if user.errors.any?
          render_error!(
            :unprocessable_entity,
            error_type: :invalid_token,
            error_message: 'You have provided an invalid confirmation token.'
          )
        end

        head :no_content
      end
    end
  end
end
