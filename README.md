# Rails API Starter

This is a boilerplate for developing RESTful APIs with Ruby on Rails.

## Usage

To use the boilerplate, simply clone this repo:

```console
$ git clone git://github.com/alessandro1997/rails-api-starter.git my-project
$ cd my-project
```

You will also need to configure the application and the database:

```console
$ cp config/database.example.yml config/database.yml
$ cp config/application.example.yml config/application.yml
```

Once you've done with the configuration, you can setup the database:

```console
$ rake db:setup
```

You're ready to go!

## Dependencies

- Ruby 2.3
- PostgreSQL
- Rails 5

## Documentation

The documentation for the API is written in [API Blueprint](https://apiblueprint.org/) and stored in
the `doc` directory.

To generate the static documentation, run:

```console
$ ./bin/build-docs
```

The documentation will be accessible at the root of your application.

## Testing

RSpec is configured for testing. To run the tests:

```console
$ bin/rspec
```

## Deployment

The application is already configured for deployment on Heroku (including a release comamnd that
runs DB migrations).

Provided that you have the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) installed,
deploying a new app should be as simple as:

```console
$ heroku create
$ figaro heroku
$ git push heroku master
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alessandro1997/rails-api-starter.

## License

This software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
