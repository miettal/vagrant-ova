# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-ova/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-ova"
  spec.version       = Vagrant::OVA::VERSION
  spec.authors       = ["Hiromasa Ihara"]
  spec.email         = ["taisyo@hongo.wide.ad.jp"]
  spec.description   = "Output *.ova on Vagrant VM."
  spec.summary       = "Output *.ova on Vagrant VM."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

