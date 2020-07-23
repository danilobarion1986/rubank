# frozen_string_literal: true

require "rubank/version"
require "rubank/client"
require "dry/configurable"

# :no-doc:
module Rubank
  extend Dry::Configurable

  class Error < StandardError; end

  # Pass a block for nested configuration (works to any depth)
  setting :authentication do
    # Can pass a default value
    setting :qrcode do
      setting :render_format, :html
      setting :seconds_to_scan, 15
    end
  end

  def self.version
    Rubank::VERSION
  end
end
