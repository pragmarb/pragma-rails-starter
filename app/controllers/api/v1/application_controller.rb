# frozen_string_literal: true
module API
  module V1
    class ApplicationController < ::ApplicationController
      class ApplicationError < StandardError
        attr_reader :status, :options

        def initialize(status, options = {})
          super(options[:error_message].to_s)

          @status = status
          @options = options
        end
      end

      rescue_from ApplicationError do |error|
        render_error error.status, error.options
      end

      def render_error(status, options = {})
        render status: status, json: options
      end

      def render_error!(status, options = {})
        fail ApplicationError.new(status, options)
      end
    end
  end
end
