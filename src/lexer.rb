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
    when 'a'..'z'
      token = identifier_token(chars)
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

    while ('0'..'9').include?(chars.peek) || chars.peek == '_' do
      digits.push(chars.next)
    end

    [:integer, digits.join]
  end

  def identifier_token(chars)
    letters = []

    while ('a'..'z').include?(chars.peek) || chars.peek == '_' do
      letters.push(chars.next)
    end

    [:identifier, letters.join]
  end
end
