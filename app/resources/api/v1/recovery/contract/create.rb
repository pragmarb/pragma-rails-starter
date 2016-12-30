# frozen_string_literal: true
module API
  module V1
    module Recovery
      module Contract
        class Create < Pragma::Contract::Base
          property :email

          validation do
            required(:email).filled(format?: Devise.email_regexp)
          end
        end
      end
    end
  end
end
