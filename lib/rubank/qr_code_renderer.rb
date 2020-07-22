# frozen_string_literal: true

require 'erb'
require 'launchy'
require 'tempfile'

# :no-doc:
module Rubank
  # Class responsible for render a QR Code
  class QrCodeRenderer
    FILENAME = 'qr_code.html'
    SECONDS_TO_SCAN = 15

    attr_reader :qr_code_html

    # Render a QR Code as a HTML temporary file.
    def call(qr_code_html, **opts)
      @qr_code_html = qr_code_html
      open_tempfile(create_tempfile)

      sleep opts.fetch(:seconds_to_scan, SECONDS_TO_SCAN) and return
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
  end
end
