# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ticketmaster-bugshelf/version"

Gem::Specification.new do |s|
  s.name        = "ticketmaster-bugshelf"
  s.version     = Ticketmaster::Bugshelf::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thomas Steinhausen"]
  s.email       = ["ts@image-addicts.de"]
  s.homepage    = ""
  s.summary     = %q{A tickemaster provider for bugshelf.}
  s.description = %q{A tickemaster provider to make bugshelf api usable with ticketmaster.}

  s.rubyforge_project = "ticketmaster-bugshelf"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
