source 'https://rubygems.org'
ruby '2.3.2'

# Ruby on Rails
gem 'rails', '~> 5.0.0'

# ActiveRecord
gem 'pg'

# Orchestration
gem 'puma'
gem 'procodile'
gem 'figaro'

# CORS
gem 'rack-cors'

group :production do
  # Heroku
  gem 'rails_12factor'
end

group :development, :test do
  # Factories
  gem 'factory_girl_rails'
  gem 'faker'

  # Debugging
  gem 'pry-rails'
  gem 'pry-rescue'

  # Testing
  gem 'rspec-rails'

  # Code quality
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :development do
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

