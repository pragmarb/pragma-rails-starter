module RequestHelpers
  def parsed_response
    @parsed_response ||= JSON.parse(last_response.body)
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request

  config.before type: :request do
    header 'Content-Type', 'application/json'
    header 'Accept', 'application/json'
  end
end
