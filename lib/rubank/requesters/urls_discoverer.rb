# frozen_string_literal: true

require "oj"

# :no-doc:
module Rubank
  module Requesters
    # Get URLs from Nubank's discovery endpoint
    class UrlsDiscoverer < Base
      # Get all available URLs.
      #
      # @return [Hash<Symbol, String>] available URLs
      def call
        super
        raise Requesters::Error, "Request failed", request: request if response_code >= 400

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
        "https://prod-s0-webapp-proxy.nubank.com.br/api/discovery"
      end
    end
  end
end
