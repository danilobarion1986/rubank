require "rubank/version"
require "rubank/client"

module Rubank
  class Error < StandardError; end

  def self.version
    Rubank::VERSION
  end
end
