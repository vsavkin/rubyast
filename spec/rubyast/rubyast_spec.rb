require File.expand_path(File.dirname(__FILE__) + "/../../lib/rubyast")

module RubyAST
  describe RubyAST do
    context "#parse" do
      let(:filename) { "filename" }

      let(:ast) do
        RubyAST.parse(filename, "x = 1", :line_number => 100, :ruby_version => "RUBY1_8")
      end

      it "should return parsed AST" do
        new_line_node = ast.body_node
        assignment = new_line_node.next_node
        fixnum_node = assignment.value_node

        assignment.name.should == "x"
        fixnum_node.value.should == 1
      end

      it "should set correct line number" do
        ast.position.file.should == filename
        ast.position.start_line.should == 100
        ast.position.end_line.should == 100
      end

      it "should default line number to 0" do
        ast = RubyAST.parse(filename, "x = 1")
        ast.position.start_line.should == 0
      end

      it "should default ruby_version to 1.9" do
        RubyAST.parse(filename, "{x: 1}")
        lambda { RubyAST.parse(filename, "{x: 1}", :ruby_version => "RUBY1_8") }.should raise_error(SyntaxException)
      end
    end

    context "#to_source" do
      let(:original_source) do
        %q{x = '1' + "2"}
      end

      let(:ast) do
        RubyAST.parse("filename", original_source)
      end

      it "should generate source from AST" do
        source = RubyAST.to_source(ast, original_source)
        source.should == original_source
      end

      it "will ignore quote types when original source is not passed" do
        source = RubyAST.to_source(ast)
        source.should == 'x = "1" + "2"'
      end
    end
  end
end