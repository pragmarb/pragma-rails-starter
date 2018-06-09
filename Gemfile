# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.1'

# Ruby on Rails
gem 'rails', '~> 5.1.0'

# ActiveRecord
gem 'pg', '~> 0.21'

# Orchestration
gem 'figaro'
gem 'foreman'
gem 'puma'

# CORS
gem 'rack-cors'

# API
gem 'pragma-rails', '~> 2.0'

# Background jobs
gem 'clockwork'
gem 'sidekiq'

# Error reporting
gem 'bugsnag'

group :production do
  # Heroku
  gem 'rails_12factor'

  # Throttling
  gem 'rack-attack'
end

group :development, :test do
  # Factories
  gem 'factory_bot_rails'
  gem 'faker'

  # Debugging
  gem 'pry-rails'

  # Testing
  gem 'rspec-rails'
end

group :development do
  # Code quality
  gem 'rubocop'
  gem 'rubocop-rspec'

  # Preloading
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
end

group :test do
  # Testing
  gem 'capybara'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'webmock'

  # CircleCI
  gem 'rspec_junit_formatter'
end
