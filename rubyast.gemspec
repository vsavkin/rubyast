# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubyast/version"

Gem::Specification.new do |s|
  s.name        = "rubyast"
  s.version     = RubyAST::VERSION
  s.authors     = ["Victor Savkin"]
  s.email       = ["vic.savkin@gmail.com"]
  s.homepage    = "http://github.com/vsavkin/rubyast"
  s.summary     = %q{RubyAST parsers source code, transforms AST, and generates source code from AST}
  s.description = %q{RubyAST parsers source code, transforms AST, and generates source code from AST}

  s.rubyforge_project = "rubyast"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "pry"

  unless defined?(JRUBY_VERSION)
    s.add_runtime_dependency "rjb"
  end
end