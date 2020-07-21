require "rubank/version"

module Rubank
  class Error < StandardError; end

  def self.version
    Rubank::VERSION
  end

  class Client
  end
end
