# frozen_string_literal: true
module API
  module V1
    module Confirmation
      module Contract
        class Create < Pragma::Contract::Base
          property :email

          validation do
            required(:email).filled
          end
        end
      end
    end
  end
end
