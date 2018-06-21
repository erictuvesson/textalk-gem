# frozen_string_literal: true

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "textalk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "textalk"
  s.version     = Textalk::VERSION
  s.authors     = ["Eric Tuvesson"]
  s.email       = ["eric.tuvesson@gmail.com"]
  s.homepage    = "https://github.com/erictuvesson/textalk-gem"
  s.summary     = "Textalk API"
  s.description = "Textalk API"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"
  s.add_dependency "faraday", "~> 0.15"
  s.add_dependency "write_xlsx"
  s.add_dependency "prawn", "~> 2.2.2"
end
