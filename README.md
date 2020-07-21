# Rubank

[![Gem Version](https://badge.fury.io/rb/rubank.svg)](https://badge.fury.io/rb/rubank)

An unofficial client for Nubank API.

You can get your Nubank account info, bills, and other information available throught its public API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubank'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubank

## Usage

First, you need to instantiate the client:

```ruby
client = Rubank::Client.new
```

Then, you need to authenticate with your credentials. You can do it by two ways:

1) Directly passing your credentials:

```ruby
client.authenticate(username: "your_username", password: "your_secret_password")
```

2) Using environment variables:

```ruby
client.authenticate
```

The client will then look for the NUBANK_USERNAME and NUBANK_PASSWORD environment variables.

Either way, you'll receive a `Rubank::Client::AuthenticationError` error if the credentials are wrong or missing.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/danilobarion1986/rubank/issues.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
