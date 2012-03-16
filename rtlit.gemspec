# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rtlit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors           = ["Zohar Arad"]
  gem.email             = ["zohar@zohararad.com"]
  gem.description       = %q{Converts CSS files from left-to-right to right-to-left}
  gem.summary           = %q{CSS left-to-right to right-to-left converter}
  gem.homepage          = "https://github.com/zohararad/rtlit"
  gem.rubyforge_project = "rtlit"

  gem.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files             = `git ls-files`.split("\n")
  gem.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name              = "rtlit"
  gem.require_paths     = ["lib"]
  gem.version           = RTLit::VERSION
end
