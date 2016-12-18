module API
  module V1
    class TokensController < API::V1::ApplicationController
      def create
        %w(email password).each do |param|
          render_error!(
            :unprocessable_entity,
            error_type: :missing_parameter,
            error_message: "The '#{param}' parameter is required for authentication."
          ) if params[param].blank?
        end

        user = User.find_for_authentication(email: params[:email])

        render_error!(
          :unprocessable_entity,
          error_type: :invalid_credentials,
          error_message: 'The credentials you have provided are not valid.'
        ) unless user && user.valid_password?(params[:password])

        render_error!(
          :unauthorized,
          error_type: user.inactive_message,
          error_message: t(
            "devise.failure.#{user.inactive_message}",
            default: 'You cannot authenticate at this moment.'
          )
        ) unless user.active_for_authentication?

        token = Knock::AuthToken.new payload: { sub: user.id }
        render status: :created, json: { token: token.token }
      end
    end
  end
end
