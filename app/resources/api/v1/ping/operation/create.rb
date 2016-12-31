# frozen_string_literal: true
module API
  module V1
    module Ping
      module Operation
        class Create < Pragma::Operation::Create
          protected

          def build_record
            OpenStruct.new
          end
        end
      end
    end
  end
end
