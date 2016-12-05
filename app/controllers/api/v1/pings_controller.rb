# frozen_string_literal: true
module API
  module V1
    class PingsController < ::ApplicationController
      def create
        head :no_content
      end
    end
  end
end
