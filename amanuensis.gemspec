# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amanuensis/version'

Gem::Specification.new do |spec|
  spec.name          = "amanuensis"
  spec.version       = Amanuensis::VERSION
  spec.authors       = ["Anthony Laibe"]
  spec.email         = ["anthony@laibe.cc"]
  spec.summary       = %q{Changelog generator}
  spec.description   = %q{Changelog generator}
  spec.homepage      = "http://alaibe.github.io/amanuensis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit"
  spec.add_dependency "pony"
  spec.add_dependency "activesupport"
  spec.add_dependency "interchange"
  spec.add_dependency "thor"
  spec.add_dependency "ruby-trello"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "pry-byebug"
end
