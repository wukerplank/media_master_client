# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'oauth2'
require 'hashie'
require 'json'

require 'media_master_client/version'
require 'media_master_client/base'
require 'media_master_client/acting'
require 'media_master_client/directing'
require 'media_master_client/evergreen'
require 'media_master_client/movie'
require 'media_master_client/person'
require 'media_master_client/queued_item'

Gem::Specification.new do |spec|
  spec.name          = "media_master_client"
  spec.version       = MediaMasterClient::VERSION
  spec.authors       = ["wukerplank"]
  spec.email         = ["wukerplank@edthofer.at"]
  spec.description   = %q{Client library for MediaMaster}
  spec.summary       = %q{Client library for MediaMaster}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_runtime_dependency 'mechanize'
  spec.add_runtime_dependency 'oauth2'
  spec.add_runtime_dependency 'json'
  spec.add_runtime_dependency 'hashie'
  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
