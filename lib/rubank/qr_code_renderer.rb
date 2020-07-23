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
    DEFAULT_RENDER_FORMAT = :html

    attr_reader :qr_code

    # Render a QR Code as a temporary file.
    def call
      @qr_code = qrcode_class.new
      @qr_code_to_render = qr_code.send(render_format)
      open_tempfile(create_tempfile)

      sleep seconds_to_scan
      self
    end

    # @see #call
    def self.call
      new.call
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
      File.open("#{current_dir}/qr_code_template_#{render_format}.erb", 'rb', &:read)
    end

    def qrcode_class
      Rubank.config.authentication.qrcode[:qrcode_class] || QrCode
    end

    def seconds_to_scan
      Rubank.config.authentication.qrcode[:seconds_to_scan] || QrCodeRenderer::DEFAULT_SECONDS_TO_SCAN
    end

    def render_format
      Rubank.config.authentication.qrcode[:render_format] || QrCodeRenderer::DEFAULT_RENDER_FORMAT
    end
  end
end
