require File.expand_path(File.dirname(__FILE__) + "/rubyast/version")
require File.expand_path(File.dirname(__FILE__) + '/rubyast/include_jrubyparser')
require File.expand_path(File.dirname(__FILE__) + '/rubyast/jruby_parser_wrapper')

module RubyAST
  def self.parse file_name, source, config = {}
    line_number = config.fetch(:line_number, 0)
    ruby_version = config.fetch(:ruby_version, "RUBY1_9")
    JRubyParserWrapper.parse file_name, source, line_number, ruby_version
  end

  def self.to_source ast, original_source = ""
    JRubyParserWrapper.to_source ast, original_source
  end
end