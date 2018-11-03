class Lexer
  def tokenize(input)
    chars = input.chars

    tokens = chars.collect do |char|
      TOKEN[char.to_sym]
    end
  end

  private 

  TOKEN = {
    'x': [:identifier, 'x'],
    ' ': [:space, ' '],
    '=': [:assignment, '='],
    '1': [:integer, '1'],
    '+': [:identifier, '+'],
    '2': [:integer, '2'],
    ';': [:semicolon, ';']
  }
end
