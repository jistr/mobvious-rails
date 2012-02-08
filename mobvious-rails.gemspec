# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mobvious/rails/version"

Gem::Specification.new do |s|
  s.name        = "mobvious-rails"
  s.version     = Mobvious::Rails::VERSION
  s.authors     = ["Jiří Stránský"]
  s.email       = ["jistr@jistr.com"]
  s.homepage    = "http://github.com/jistr/mobvious-rails"
  s.summary     = %q{Rails enhancements for rendering different content for different device types}
  s.description = %q{Rails enhancements for rendering different content for different device types}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "mobvious"


  # == DEVELOPMENT DEPENDENCIES ==
  # Smart irb
  s.add_development_dependency 'pry'

  # Specs
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'

  # Running tests during development
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-minitest'
  # Linux Guard watching
  s.add_development_dependency 'rb-inotify'
  # Linux Guard notifications
  s.add_development_dependency 'libnotify'

  # Pretty printed test output
  s.add_development_dependency 'turn'
end
