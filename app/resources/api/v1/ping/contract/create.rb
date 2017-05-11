# frozen_string_literal: true

module API
  module V1
    module Ping
      module Contract
        class Create < Pragma::Contract::Base
          property :message

          validation do
            required(:message).filled
          end
        end
      end
    end
  end
end
