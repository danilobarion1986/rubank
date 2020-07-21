# frozen_string_literal: true

# :no-doc:
module Rubank
  # Client to interact with Nubank's endpoints
  class Client
    class AuthenticationError < StandardError; end

    attr_reader :urls

    def initialize
      @urls = Requesters::UrlsDiscoverer.call
    end

    def authenticate(username: nil, password: nil)
      username ||= ENV['NUBANK_USERNAME']
      password ||= ENV['NUBANK_PASSWORD']

      raise AuthenticationError, "Credentials are missing!" unless username && password

      response = Requesters::CredentialsAuthenticator.call(urls, username, password)
      raise AuthenticationError, "Credentials are missing!" if response[:error]
    end
  end
end
