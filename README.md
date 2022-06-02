# Roda Template

It is a Roda-Sequel stack for the backend projects.

## Installation

```bash
bundle install
createdb -U postgres -O [user_name] my_app_production
createdb -U postgres -O [user_name] my_app_test
createdb -U postgres -O [user_name] my_app_development
```

## Migrations

```ruby
bundle exec rake dev_up  # Migrate the development database up
bundle exec rake test_up # Migrate the test database up
bundle exec rake prod_up # Migrate the production database up
```

## Run tests

```ruby
bundle exec rake # default rake task => Run all tests
bundle exec rake model_spec # Run tests in service folder
bundle exec rake controller_spec # Run tests in service folder
bundle exec rake service_spec # Run tests in service folder
```

Check `rake --tasks` for all test cases.

## Run server

```
rackup
```