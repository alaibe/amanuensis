# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amanuensis/version'

Gem::Specification.new do |spec|
  spec.name          = "amanuensis"
  spec.version       = Amanuensis::VERSION
  spec.authors       = ["Anthony Laibe"]
  spec.email         = ["anthony@laibe.cc"]
  spec.summary       = %q{Amanuensis is a changelog generator}
  spec.description   = %q{Amanuensis is a changelog generator which integrate with all the major code managers and trackers}
  spec.homepage      = "http://alaibe.github.io/amanuensis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit", '~>3.8'
  spec.add_dependency "pony", '~>1.11'
  spec.add_dependency "activesupport", '~>4.2'
  spec.add_dependency "interchange", '~>0.1'
  spec.add_dependency "thor", '~>0.19'
  spec.add_dependency "ruby-trello", '~>1.2'
  spec.add_dependency "tracker_api", '~>0.2'

  spec.add_development_dependency "bundler", '~>1.9'
  spec.add_development_dependency "rake", '~>10.4'
  spec.add_development_dependency "rspec", '~>3.2'
  spec.add_development_dependency "vcr", '~>2.9'
  spec.add_development_dependency "webmock", '~>1.21'
  spec.add_development_dependency "dotenv", '~>2.0'
  spec.add_development_dependency "pry-byebug", '~>3.1'
end
