module RequestHelpers
  def self.included(klass)
    klass.extend ClassMethods
  end

  def parsed_response
    @parsed_response ||= JSON.parse(last_response.body)
  end

  module ClassMethods
    def with_auth
      let(:current_user) { create(:user, :confirmed) }

      before do
        token = Knock::AuthToken.new(payload: {
          sub: current_user.id
        }).token

        header 'Authorization', "Bearer #{token}"
      end
    end
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request

  config.before type: :request do
    header 'Content-Type', 'application/json'
    header 'Accept', 'application/json'
  end
end
