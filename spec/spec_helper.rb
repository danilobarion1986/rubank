# frozen_string_literal: true

require "simplecov"
SimpleCov.start

require "bundler/setup"
require "webmock/rspec"
require "pry"
require "uuid"
require "rubank"
require "rubank/client"
require "rubank/qr_code"
require "rubank/qr_code_renderer"

require "rubank/requesters/base"
require "rubank/requesters/urls_discoverer"
require "rubank/requesters/app_urls_discoverer"
require "rubank/requesters/credentials_authenticator"
require "rubank/requesters/qr_code_authenticator"

WebMock.disable_net_connect!(allow_localhost: true, allow: "www.example.com")

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
