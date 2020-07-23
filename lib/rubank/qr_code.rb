# frozen_string_literal: true

require 'securerandom'
require 'rqrcode'

# :no-doc:
module Rubank
  # Class representing a QrCode
  class QrCode
    attr_reader :uuid, :qrcode

    def initialize
      @uuid = SecureRandom.uuid
      @qrcode = RQRCode::QRCode.new(@uuid)
    end

    def html
      qrcode.as_html
    end
  end
end
