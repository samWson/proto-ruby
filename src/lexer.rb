class Lexer
  def tokenize(input)
    chars = input.chars.each
    tokens = []

    loop do
      begin
        tokens.push(token(chars))
      rescue StopIteration
        break
      end
    end

    tokens
  end

  private 
 
  def token(chars)
    token = []

    case chars.peek
    when '0'..'9'
      token = integer_token(chars)
    when 'x'
      token = [:identifier, 'x']
      chars.next
    when ' '
      token = [:space, ' ']
      chars.next
    when '='
      token = [:assignment, '=']
      chars.next
    when '+'
      token = [:identifier, '+']
      chars.next
    when ';'
      token = [:semicolon, ';']
      chars.next
    else
      token = [:illegal, chars.next]
    end

    token
  end

  def integer_token(chars)
    digits = []

    while ('0'..'9').include?(chars.peek) do
      digits.push(chars.next)
    end

    [:integer, digits.join]
  end
end
