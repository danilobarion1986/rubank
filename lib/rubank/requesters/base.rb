require 'typhoeus'
require 'forwardable'

module Rubank
  module Requesters
    class Error < StandardError; end

    class Base
      extend Forwardable
      attr_reader :request

      def_delegators :@request, :response_body, :response_code

      BASE_HEADERS = {
        'Content-Type' => 'application/json',
        'X-Correlation-Id' => 'WEB-APP.pewW9',
        'User-Agent' => 'Rubank - https://github.com/danilobarion1986/rubank',
        'Origin' => 'https://conta.nubank.com.br',
        'Referer' => 'https://conta.nubank.com.br/'
      }.freeze

      def call
        @request = Typhoeus.send(http_method, url, request_options)
      end

      private

      def request_options
        options.tap do |opts|
          opts[:headers] = BASE_HEADERS.merge(opts.fetch(:headers, {}))
        end
      end

      def http_method
        :get
      end

      def url
        "https://www.example.com/"
      end

      def options
        {}
      end
    end
  end
end
