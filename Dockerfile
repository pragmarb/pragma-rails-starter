FROM ruby:2.4.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client
RUN mkdir /pragma-rails-starter
WORKDIR /pragma-rails-starter
ADD Gemfile /pragma-rails-starter/Gemfile
ADD Gemfile.lock /pragma-rails-starter/Gemfile.lock
RUN bundle install
COPY config/application.example.yml /pragma-rails-starter/config/application.yml
ADD . /pragma-rails-starter
