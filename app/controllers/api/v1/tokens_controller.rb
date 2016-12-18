module API
  module V1
    class TokensController < API::V1::ApplicationController
      def create
        fail_for_invalid_credentials if params[:email].blank? || params[:password].blank?

        user = User.find_for_authentication(email: params[:email])
        fail_for_invalid_credentials unless valid_user?(user)

        token = Knock::AuthToken.new payload: { sub: user.id }
        render status: :created, json: { token: token.token }
      end

      private

      def fail_for_invalid_credentials
        render_error!(
          :unprocessable_entity,
          error_type: :invalid_credentials,
          error_message: 'The credentials you have provided are not valid.'
        )
      end

      def valid_user?(user)
        user && user.active_for_authentication? && user.valid_password?(params[:password])
      end
    end
  end
end
