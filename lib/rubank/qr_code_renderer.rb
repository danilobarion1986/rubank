# frozen_string_literal: true

require 'erb'
require 'launchy'
require 'tempfile'

# :no-doc:
module Rubank
  # Class responsible for render a QR Code
  class QrCodeRenderer
    FILENAME = 'qr_code.html'
    DEFAULT_SECONDS_TO_SCAN = 15

    attr_reader :qr_code_html

    # Render a QR Code as a temporary file.
    def call
      @qr_code_html = QrCode.new.as_html
      open_tempfile(create_tempfile)

      sleep seconds_to_scan
    end

    # @see #call
    def self.call(qr_code_html)
      new.call(qr_code_html)
    end

    private

    def create_tempfile
      result = ERB.new(template).result(binding)
      tempfile = Tempfile.new(FILENAME)
      tempfile.write(result)
      tempfile
    end

    def open_tempfile(tempfile)
      Launchy.open(tempfile.path)
    end

    def template
      current_dir = File.expand_path(__dir__)
      File.open("#{current_dir}/qr_code_template.erb", 'rb', &:read)
    end

    def seconds_to_scan
      Rubank.config.authentication.qrcode[:seconds_to_scan] || QrCodeRenderer::DEFAULT_SECONDS_TO_SCAN
    end
  end
end
