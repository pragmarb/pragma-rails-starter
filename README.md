# Pragma/Rails Starter

This is a boilerplate for developing RESTful APIs with Ruby on Rails.

## Usage

To use the boilerplate, simply clone this repo:

```console
$ git clone git://github.com/pragmarb/pragma-rails-starter.git my-project
$ cd my-project
```

You will also need to configure the application and the database:

```console
$ cp config/database.example.yml config/database.yml
$ cp config/application.example.yml config/application.yml
```

Once you're done with the configuration, you can setup the database:

```console
$ rake db:setup
```

Run the application with:

```console
$ foreman s -f Procfile.development
```

## Updates

You can keep the starter up to date even after you start development on the application by adding
it as a separate repo:

```console
$ git remote add upstream git://github.com/pragmarb/pragma-rails-starter.git
$ git fetch upstream
$ git merge upstream master
```

## Dependencies

- Ruby 2.3
- PostgreSQL
- Rails 5

## Included tools

The following tools are included and configured in the boilerplate:

- [Puma](http://puma.io/) as the web server
- [Foreman](https://github.com/ddollar/foreman) for process management
- [Figaro](https://github.com/laserlemon/figaro) for configuration management
- [Rack::CORS](https://github.com/cyu/rack-cors) for CORS
- [Rack::Attack](https://github.com/kickstarter/rack-attack) for rate-limiting
- [Pragma](https://github.com/pragmarb/pragma) for business logic
- [Bugsnag](https://bugsnag.com) for error tracking
- [CircleCI](https://circleci.com) for continuous integration
- [Docker](https://docker.com) and [Compose](https://docs.docker.com/compose/) for containerization

## Testing

RSpec is configured for testing. To run the tests:

```console
$ bin/rspec
```

In the tests, you have access to the `#last_response` and `#parsed_response` methods which return,
respectively, the last response object and the parsed body of the response.

## Deployment

The application is already configured for deployment on Heroku, including a release command that
runs DB migrations.

Provided that you have the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) installed,
deploying a new app should be as simple as:

```console
$ heroku create
$ figaro heroku
$ git push heroku master
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pragmarb/pragma-rails-starter.

## License

This software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
