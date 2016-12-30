# frozen_string_literal: true
module API
  module V1
    module Token
      module Contract
        class Create < Pragma::Contract::Base
          property :email
          property :password

          validation do
            required(:email).filled(format?: Devise.email_regexp)
            required(:password).filled
          end
        end
      end
    end
  end
end
