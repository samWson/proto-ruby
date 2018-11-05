require_relative 'lexer'

class Repl
  PROMPT = '>> '

  def initialize()
    @lexer = Lexer.new
  end

  def start()
    loop do
      print PROMPT
      input = gets
      tokens = @lexer.tokenize(input)
      tokens.each { |token| puts token.to_s }
    end
  end
end
