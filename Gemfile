source 'https://rubygems.org'
ruby '2.4.2'

# Ruby on Rails
gem 'rails', '~> 5.1.0'

# ActiveRecord
gem 'pg'

# Orchestration
gem 'puma'
gem 'foreman'
gem 'figaro'

# CORS
gem 'rack-cors'

# API
gem 'pragma-rails', '~> 2.0'

# Background jobs
gem 'sidekiq'
gem 'clockwork'

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
  gem 'factory_girl_rails'
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
end
