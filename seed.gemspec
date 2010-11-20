# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'seed/version'

Gem::Specification.new do |s|
  s.name = "seed"
  s.version = Seed::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Jeremy Durham']
  s.email = ['jeremydurham@gmail.com']
  s.homepage = 'http://www.onemanwonder.com/projects/seed'  
  s.summary = 'Another simple seeding library'
  s.description = 'Another simple seeding library'

  s.required_rubygems_version = ">= 1.3.6"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
