# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ticketmaster-bugshelf/version"

Gem::Specification.new do |s|
  s.name        = "ticketmaster-bugshelf"
  s.version     = Ticketmaster::Bugshelf::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Steinhausen"]
  s.email       = ["ts@image-addicts.de"]
  s.homepage    = "http://bugshelf.com"
  s.summary     = %q{Tickemaster provider for Bugshelf.}
  s.description = %q{A tickemaster provider to make Bugshelf api usable with ticketmaster.}
  
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]

  s.rubyforge_project = "ticketmaster-bugshelf"
  
  s.add_runtime_dependency(%q<ticketmaster>, [">= 0.6.6"])

  s.files         = `hg manifest`.split("\n")
  s.test_files    = []
  s.executables   = []
  s.require_paths = ["lib"]
end
