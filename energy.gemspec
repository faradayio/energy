# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "energy/version"

Gem::Specification.new do |s|
  s.name        = "energy"
  s.version     = Energy::VERSION
  s.authors     = ["Seamus Abshere"]
  s.email       = ["seamus@abshere.net"]
  s.homepage    = "https://github.com/brighterplanet/energy"
  s.summary     = %q{Energy information client from Brighter Planet}
  s.description = %q{Energy information client from Brighter Planet}

  s.rubyforge_project = "energy"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'test-unit'
  s.add_development_dependency 'rake'
  s.add_runtime_dependency 'activesupport'
end
