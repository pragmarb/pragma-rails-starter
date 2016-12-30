module API
  module V1
    module Recovery
      module Contract
        class Complete < Pragma::Contract::Base
          property :password

          validation do
            required(:password).filled
          end
        end
      end
    end
  end
end
