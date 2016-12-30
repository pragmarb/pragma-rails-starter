# frozen_string_literal: true
module API
  module V1
    module Recovery
      module Operation
        class Complete < Pragma::Operation::Base
          include Pragma::Operation::Defaults

          def call
            user = User.reset_password_by_token(
              reset_password_token: params[:id],
              password: params[:password],
              password_confirmation: params[:password]
            )

            validate! user
            respond_with_validation_errors!(user) if user.errors.any?

            head :no_content
          end
        end
      end
    end
  end
end
