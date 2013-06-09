# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sorted_array/version'

Gem::Specification.new do |spec|
  spec.name          = "sorted_array"
  spec.version       = SortedArray::VERSION
  spec.authors       = ["Andi Altendorfer"]
  spec.email         = ["andi@iboard.cc"]
  spec.description   = %q{Provides class SortedArray which you can initialize with a block used to sort the Array after each push-action.}
  spec.summary       = 'SortedArray.new { |a,b| a.foo <=> b.foo }'
  spec.homepage      = "https://github.com/iboard/sorted_array"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-expectations"
  spec.add_development_dependency "rspec-mocks"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "simplecov"
end
