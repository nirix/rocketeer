# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rocketeer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rocketeer"
  gem.version       = Rocketeer::VERSION
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.summary       = "A collection of helpers for Sinatra."
  gem.description   = "Rocketeer is a collection of helpers for the Sinatra framework."
  gem.homepage      = "https://github.com/nirix/rockets"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'sinatra', '~> 1.3.5'
  gem.add_development_dependency 'bacon', '~> 1.2.0'
  gem.add_development_dependency 'bacon-colored_output', '~> 1.0.1'
end
