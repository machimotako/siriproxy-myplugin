# -*- encoding: utf-8 -*-
require File.expand_path('../lib/siriproxy-myplugin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["machimotako"]
  gem.email         = ["masatako@mac.com"]
  gem.description   = %q{My 1st siriproxy plugin.}
  gem.summary       = %q{My 1st siriproxy plugin. It's sample plugin.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "siriproxy-myplugin"
  gem.require_paths = ["lib"]
  gem.version       = Siriproxy::Myplugin::VERSION

  gem.add_runtime_dependency "iremocon"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "cora", '0.0.4'
  gem.add_development_dependency "uuidtools"
  gem.add_development_dependency "eventmachine"
end
