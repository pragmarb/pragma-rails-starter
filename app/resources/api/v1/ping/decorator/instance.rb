# frozen_string_literal: true

module API
  module V1
    module Ping
      module Decorator
        class Instance < Pragma::Decorator::Base
          property :message
        end
      end
    end
  end
end
