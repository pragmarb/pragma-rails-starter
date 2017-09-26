# frozen_string_literal: true

module API
  module V1
    module Ping
      module Operation
        class Create < Pragma::Operation::Base
          self['model.class'] = OpenStruct

          step Pragma::Operation::Macro::Classes()
          step Pragma::Operation::Macro::Model()
          step Pragma::Operation::Macro::Policy()
          failure :handle_unauthorized!, fail_fast: true
          step Pragma::Operation::Macro::Contract::Build()
          step Pragma::Operation::Macro::Contract::Validate()
          failure :handle_invalid_contract!, fail_fast: true
          step :sync!
          step Pragma::Operation::Macro::Decorator(name: :instance)
          step :respond!

          def handle_unauthorized!(options)
            options['result.response'] = Pragma::Operation::Response::Forbidden.new.decorate_with(
              Pragma::Decorator::Error
            )
          end

          def handle_invalid_contract!(options)
            options['result.response'] = Pragma::Operation::Response::UnprocessableEntity.new(
              errors: options['contract.default'].errors
            ).decorate_with(Pragma::Decorator::Error)
          end

          def sync!(options)
            options['contract.default'].sync
          end

          def respond!(options)
            options['result.response'] = Pragma::Operation::Response::Created.new(
              entity: options['result.decorator.instance']
            )
          end
        end
      end
    end
  end
end
