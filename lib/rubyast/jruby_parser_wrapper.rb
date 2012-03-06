module RubyAST
  class SyntaxException < Exception; end

  module JRubyParserWrapper
    extend self

    def parse file_name, source, line_number, ruby_version
      version = J::CompatVersion.getVersionFromString(ruby_version)
      config = J::ParserConfiguration.new(line_number, version)
      reader = J::StringReader.new(source)

      J::Parser.new.parse(file_name, reader, config)
    rescue ::SyntaxException => e
      raise SyntaxException, e.message
    end

    def to_source ast, original_source
      writer = J::StringWriter.new
      visitor = J::ReWriteVisitor.new(writer, original_source)
      ast.accept(visitor)
      writer.toString
    end
  end
end