# frozen_string_literal: true
module API
  module V1
    module Confirmation
      module Operation
        class Complete < Pragma::Operation::Base
          def call
            user = User.confirm_by_token(params[:id])

            if user.errors.any?
              respond_with!(
                status: :unprocessable_entity,
                resource: {
                  error_type: :invalid_token,
                  error_message: 'You have provided an invalid confirmation token.'
                }
              )
            end

            head :no_content
          end
        end
      end
    end
  end
end
