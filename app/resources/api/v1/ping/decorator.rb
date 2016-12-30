# frozen_string_literal: true
module API
  module V1
    module Ping
      class Decorator < Pragma::Decorator::Base
        property :message
      end
    end
  end
end
