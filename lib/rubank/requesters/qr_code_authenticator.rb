# frozen_string_literal: true

require "oj"
require "json"

# :no-doc:
module Rubank
  module Requesters
    # Authenticate using QR Code as MFA.
    class QrCodeAuthenticator < Base
      attr_reader :lift_url, :access_token

      LOGIN_TYPE = 'login-webapp'

      # Do the request to the lift app endpoint.
      def call(lift_url, access_token)
        @lift_url = lift_url
        @access_token = access_token

        QrCodeRenderer.call

        super()
        Oj.load(response_body, symbol_keys: true)
      end

      # @see #call
      def self.call(lift_url, access_token)
        new.call(lift_url, access_token)
      end

      def http_method
        :post
      end

      def url
        lift_url
      end

      def options
        { body: body, headers: headers }
      end

      private

      def body
        { 'qr_code_id' => uuid,
          'type' => LOGIN_TYPE }.to_json
      end

      def headers
        { "Authorization" => "Bearer #{access_token}" }
      end
    end
  end
end