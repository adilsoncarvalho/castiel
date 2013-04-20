# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'castiel/version'

Gem::Specification.new do |spec|
  spec.name          = "castiel"
  spec.version       = Castiel::VERSION
  spec.authors       = ["Adilson Carvalho"]
  spec.email         = ["adilson@adilsoncarvalho.com.br"]
  spec.description   = 'Extension do add date and time capabilities to OptionsParse'
  spec.summary       = 'Extension do add date and time capabilities to OptionsParse'
  spec.homepage      = ''
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0.9.2'
  spec.add_development_dependency 'rspec', '~> 2.5'
  spec.add_development_dependency 'fuubar', '~> 1.1.0'
end
