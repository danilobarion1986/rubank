# frozen_string_literal: true

require_relative "lib/rubank/version"

Gem::Specification.new do |spec|
  spec.name          = "rubank"
  spec.version       = Rubank::VERSION
  spec.authors       = ["Danilo Barion Nogueira"]
  spec.email         = ["danilo.barion@gmail.com"]

  spec.summary       = "Unofficial client for Nubank public APIs."
  spec.description   = "Get your Nubank account info, with this unofficial client."
  spec.homepage      = "https://github.com/danilobarion1986/rubank"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/releases"

  spec.add_dependency "oj", "~> 3.10.7"
  spec.add_dependency "typhoeus", "~> 1.4.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
