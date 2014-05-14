# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tailnudge/version'

Gem::Specification.new do |spec|
  spec.name          = "tailnudge"
  spec.version       = Tailnudge::VERSION
  spec.authors       = ["Bruce Williams"]
  spec.email         = ["brwcodes@gmail.com"]
  spec.summary       = %q{Display OSX notification when a tailed file matches a pattern}
  spec.description   = %q{Tailnudge displays OS notifications when a tailed file matches a pattern; useful for being nudged more forcibly when you encounter deprecation, errors in log files.}
  spec.homepage      = "http://github.com/bruce/tailnudge"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-notifier"
  spec.add_dependency "eventmachine-tail"
  spec.add_dependency "thor"

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
end
