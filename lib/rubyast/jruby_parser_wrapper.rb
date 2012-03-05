module RubyAST
  module JRubyParserWrapper
    extend self
    def parse file_name, source, line_number, ruby_version
      config = ParserConfiguration.new(line_number, CompatVersion.getVersionFromString(ruby_version))
      reader = StringReader.new(source)
      Parser.new.parse(file_name, reader, config)
    end
  end
end