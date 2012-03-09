# RubyAST

RubyAST is a small library on top of jrubyparser. The library works with ALL VERSIONS OF RUBY. YOU DON'T NEED TO USE JRUBY (but why not, it's awesome!).

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


## AST Nodes

    ast = RubyAST.parse("(string)", "x = 1")
    new_line_node = ast.body_node

    assignment = new_line_node.next_node
    fixnum_node = assignment.value_node

    assignment.name.should == "x"
    fixnum_node.value.should == 1

Check out [jruby-parser](https://github.com/jruby/jruby-parser) for additoinal information about different types of nodes. 