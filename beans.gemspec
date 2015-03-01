lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beans/version'

Gem::Specification.new do |spec|
  spec.name          = 'beans'
  spec.version       = Beans::VERSION
  spec.authors       = ['Corin Schedler']
  spec.email         = ['corin@dubdromic.com']
  spec.summary       = %q{A small gem for tracking coffee addiction}
  spec.description   = %q{A small gem for tracking coffee addiction}
  spec.homepage      = 'http://github.com/dubdromic/beans'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'
end
