module API
  module V1
    module Confirmation
      module Operation
        class Complete < Pragma::Operation::Base
          def call
            user = User.confirm_by_token(params[:id])
            validate! user

            head :no_content
          end
        end
      end
    end
  end
end
