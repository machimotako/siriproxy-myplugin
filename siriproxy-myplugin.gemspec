# -*- encoding: utf-8 -*-
require File.expand_path('../lib/siriproxy-myplugin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["machimotako"]
  gem.email         = ["masatako@mac.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "siriproxy-myplugin"
  gem.require_paths = ["lib"]
  gem.version       = Siriproxy::Myplugin::VERSION
end
