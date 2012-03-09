# RubyAST

RubyAST is a small library on top of jrubyparser. Though it uses jrubyparser the library works with ALL VERSIONS OF RUBY. 

## #parse

Parsing a file:

	source = File.read(file_name)
	ast = RubyAST.parse(file_name, source)

Parsing a string:

	ast = RubyAST.parse("(string)", "x = 1")

You can set a starting line number (by default it's 0):

	ast = RubyAST.parse("(string)", "x = 1", :line_number => 100)

You can set ruby version (by default it's RUBY1_9):

	ast = RubyAST.parse("(string)", "x = 1", :ruby_version => "RUBY1_9")

## #to_source

Just pass AST:

	source = RubyAST.to_source(ast)

If you want to keep quotes and heredocs, pass the original source:
	
	original_source = File.read(file_name)
	ast = RubyAST.parse(file_name, original_source)
	new_source = RubyAST.to_source(ast, original_source)


## Additional Information

Check out [jruby-parser](https://github.com/jruby/jruby-parser) for additoinal information about different types of nodes.