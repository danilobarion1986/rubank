# frozen_string_literal: true

require "oj"

# :no-doc:
module Rubank
  module Requesters
    # Get URLs from Nubank's App discovery endpoint.
    class AppUrlsDiscoverer < Base
      # Get all available App URLs.
      #
      # @return [Hash<Symbol, String>] available App URLs.
      def call
        super

        Oj.load(response_body, symbol_keys: true)
      end

      # @see #call
      def self.call
        new.call
      end

      def http_method
        :get
      end

      def url
        "https://prod-s0-webapp-proxy.nubank.com.br/api/app/discovery"
      end
    end
  end
end
