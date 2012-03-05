# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubyast/version"

Gem::Specification.new do |s|
  s.name        = "rubyast"
  s.version     = Rubyast::VERSION
  s.authors     = ["Victor Savkin"]
  s.email       = ["vic.savkin@gmail.com"]
  s.homepage    = "http://github.com/vsavkin/rubyast"
  s.summary     = %q{Allows AST Transformations for Ruby.}
  s.description = %q{Allows AST Transformations for Ruby: parsers source code,
transforms AST, generates source code based on AST}

  s.rubyforge_project = "rubyast"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
