# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "voting_booth/version"

Gem::Specification.new do |s|
  s.name = "voting_booth"
  s.version = VotingBooth::VERSION.dup
  s.platform = Gem::Platform::RUBY
  s.summary = "A Rails 3 Engine that provides voting functionality across multiple models."
  s.homepage = "http://github.com/plataformatec/devise"
  s.description = "A Rails 3 Engine that provides voting functionality across multiple models."
  s.email = %q{danhodos@gmail.com}
  s.authors = ['Dan Hodos']

  s.rubyforge_project = "voting_booth"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("rails", "~> 3.0.0")
  s.add_dependency("rubystats", "~> 0.2.3")
end
