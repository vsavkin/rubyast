module RubyAST
  module J
    jar_path = File.expand_path(File.dirname(__FILE__) + '/../../jar/jrubyparser-0.2.jar')

    if defined?(JRUBY_VERSION)
      require 'java'
      require jar_path

      java_import java.io.StringReader
      java_import java.io.StringWriter
      java_import org.jrubyparser.parser.ParserConfiguration
      java_import org.jrubyparser.Parser
      java_import org.jrubyparser.rewriter.ReWriteVisitor
      java_import org.jrubyparser.CompatVersion

      java_import org.jrubyparser.lexer.SyntaxException
    else
      require 'rjb'
      Rjb::load(jar_path, [])

      StringReader = Rjb::import('java.io.StringReader')
      StringWriter = Rjb::import('java.io.StringWriter')
      ParserConfiguration = Rjb::import('org.jrubyparser.parser.ParserConfiguration')
      Parser = Rjb::import('org.jrubyparser.Parser')
      ReWriteVisitor = Rjb::import('org.jrubyparser.rewriter.ReWriteVisitor')
      CompatVersion = Rjb::import('org.jrubyparser.CompatVersion')

      SyntaxException = Rjb::import('org.jrubyparser.lexer.SyntaxException')
    end
  end
end