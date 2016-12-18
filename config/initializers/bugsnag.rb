Bugsnag.configure do |config|
  config.api_key = ENV.fetch('BUGSNAG_API_KEY')
  config.release_stage = ENV.fetch('BUGSNAG_RELEASE_STAGE')
  config.notify_release_stages = ['production', 'staging']
  config.send_environment = true
end
