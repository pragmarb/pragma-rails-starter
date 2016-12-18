module API
  module V1
    class TokensController < API::V1::ApplicationController
      def create
        user = User.find_by(email: params[:email])
        token = AuthToken.new payload: { sub: entity.id }

        render status: :created, json: { token: token.token }
      end
    end
  end
end
