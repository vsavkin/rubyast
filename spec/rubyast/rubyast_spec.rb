require File.expand_path(File.dirname(__FILE__) + "/../../lib/rubyast")

describe RubyAST do
  context "#parse" do
    let(:ast) do
      RubyAST.parse("filename", "x = 1", :line_number => 100, :ruby_version => "RUBY_1.8")
    end

    it "should return parsed AST" do
      ast.should == 2
    end

    it "should default line number to 0"
    it "should default ruby_version to 1.9"
  end
end