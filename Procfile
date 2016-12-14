web: bundle exec rails s -b $BIND_HOST
release: bundle exec rake db:migrate
worker: bundle exec sidekiq -q default -q mailers
scheduler: bundle exec clockwork config/clock.rb
