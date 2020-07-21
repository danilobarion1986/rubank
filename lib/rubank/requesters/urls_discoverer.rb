require 'oj'

module Rubank
  module Requesters
    # Get URLs from Nubank's discovery endpoint
    class UrlsDiscoverer < Base
      # Get all available URLs.
      #
      # @return [Hash<Symbol, String>] available URLs
      def self.call
        super
        raise Requesters::Error, "Request failed", request: request if response_code >= 400

        Oj.load(response_body, symbol_keys: true)
      rescue Base::Error => e
        puts e.inspect
      end

      private def self.http_method
        :get
      end

      private def self.url
        'https://prod-s0-webapp-proxy.nubank.com.br/api/discovery'
      end
    end
  end
end
