# frozen_string_literal: true

require "oj"

# :no-doc:
module Rubank
  module Requesters
    # Authenticate username and password on login endpoint.
    class CredentialsAuthenticator < Base
      attr_reader :login_url, :username, :password

      GRANT_TYPE = 'password'
      CLIENT_ID = 'other.conta'
      CLIENT_SECRET = 'yQPeLzoHuJzlMMSAjC-LgNUJdUecx8XO'

      # Do the request to the login endpoint.
      #
      # @return [Hash<Symbol, String>] login information.
      def call(urls, username, password)
        @login_url = urls[:login]
        @username = username
        @password = password

        super()
        Oj.load(response_body, symbol_keys: true)
      end

      # @see #call
      def self.call(urls, username, password)
        new.call(urls, username, password)
      end

      def http_method
        :post
      end

      def url
        login_url
      end

      def options
        { body: body }
      end

      private

      def body
        { 'grant_type' => GRANT_TYPE,
          'login' => username,
          'password' => password,
          'client_id' => CLIENT_ID,
          'client_secret' => CLIENT_SECRET }.to_json
      end

    end
  end
end
