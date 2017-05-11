# frozen_string_literal: true

module API
  module V1
    class ResourceController < API::V1::ApplicationController
      include Pragma::Rails::ResourceController
    end
  end
end
