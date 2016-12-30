# frozen_string_literal: true
module API
  module V1
    module Token
      module Operation
        class Create < Pragma::Operation::Base
          def call
            validate! OpenStruct.new

            user = User.find_for_authentication(email: params[:email])

            unless user && user.valid_password?(params[:password])
              respond_with!(
                status: :unprocessable_entity,
                resource: {
                  error_type: :invalid_credentials,
                  error_message: 'The credentials you have provided are not valid.'
                }
              )
            end

            unless user.active_for_authentication?
              respond_with!(
                status: :unauthorized,
                resource: {
                  error_type: user.inactive_message,
                  error_message: I18n.t(
                    "devise.failure.#{user.inactive_message}",
                    default: 'You cannot authenticate at this moment.'
                  )
                }
              )
            end

            token = Knock::AuthToken.new payload: { sub: user.id }
            respond_with status: :created, resource: { token: token.token }
          end
        end
      end
    end
  end
end
