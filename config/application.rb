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

    # Configures the URL options to use outside of the request context.
    config.action_mailer.default_url_options = {
      host: ENV.fetch('HOST'),
      protocol: ENV.fetch('PROTOCOL')
    }

    # Use Sidekiq for executing background jobs.
    config.active_job.queue_adapter = :sidekiq

    # Configure Sendgrid for email delivery.
    ActionMailer::Base.smtp_settings = {
      user_name: ENV.fetch('SENDGRID_USERNAME'),
      password: ENV.fetch('SENDGRID_PASSWORD'),
      domain: ENV.fetch('MAIL_DOMAIN'),
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }

    # Use UUIDs in PostgreSQL by default.
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
  end
end
