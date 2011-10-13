# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "draper/cancan/version"

Gem::Specification.new do |s|
  s.name        = "draper-cancan"
  s.version     = Draper::CanCan::VERSION
  s.authors     = ["Andrew Kalek"]
  s.email       = ["andrew.kalek@anlek.com"]
  s.homepage    = ""
  s.summary     = %q{Adds some simple methods to your decorators to make it easier to use with rbates CanCan gem}
  s.description = %q{Adds some simple methods to your decorators to make it easier to use with rbates CanCan gem}

  s.rubyforge_project = "draper-cancan"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'draper'
  s.add_runtime_dependency 'cancan'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'active_support'
end
