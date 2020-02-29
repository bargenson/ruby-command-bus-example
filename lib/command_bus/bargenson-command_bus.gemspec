# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bargenson/command_bus/version'

Gem::Specification.new do |spec|
  spec.name          = "bargenson-command_bus"
  spec.version       = Bargenson::CommandBus::VERSION
  spec.authors       = ["@bargenson"]

  spec.summary       = %q{Command Pattern}
  spec.homepage      = "https://github.com/bargenson/command_bus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thread_safe"

  spec.add_development_dependency "bundler", "~> 2.0.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "pry", "~> 0.12.0"
end
