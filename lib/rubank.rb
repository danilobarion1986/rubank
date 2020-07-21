# frozen_string_literal: true

require "rubank/version"
require "rubank/client"

# :no-doc:
module Rubank
  class Error < StandardError; end

  def self.version
    Rubank::VERSION
  end
end
