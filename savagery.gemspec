# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'savagery/version'

Gem::Specification.new do |spec|
  spec.name          = "savagery"
  spec.version       = Savagery::VERSION
  spec.authors       = ["Micah Geisel"]
  spec.email         = ["micah@botandrose.com"]
  spec.summary       = %q{Ruthlessly sprites SVGs}
  spec.description   = %q{Ruthlessly sprites SVGs}
  spec.homepage      = "https://github.com/botandrose/savagery"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ember-rails-assets"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "actionview"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
end

