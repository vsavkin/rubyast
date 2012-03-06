module RubyAST
  class SyntaxException < Exception; end
  module JRubyParserWrapper
    extend self
    def parse file_name, source, line_number, ruby_version
      config = J::ParserConfiguration.new(line_number, J::CompatVersion.getVersionFromString(ruby_version))
      reader = J::StringReader.new(source)
      J::Parser.new.parse(file_name, reader, config)
    rescue J::SyntaxException, ::SyntaxException => e
      raise SyntaxException, e.message
    end
  end
end