require_relative 'boot'

require 'rails'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Starter
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins *(ENV.fetch('CORS_ORIGINS').split(','))
        resource '*', headers: :any, methods: :any
      end
    end

    # Export the schema in SQL, not Ruby.
    config.active_record.schema_format = :sql

    # Configures the URL options to use outside of the request context.
    config.action_mailer.default_url_options = {
      host: ENV.fetch('HOST'),
      protocol: ENV.fetch('PROTOCOL')
    }
  end
end
