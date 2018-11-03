require_relative '../src/lexer'

RSpec.describe Lexer do
  describe '#tokenize' do
    context 'x = 1 + 2;' do
      let(:lexer) { described_class.new }
      let(:input) { 'x = 1 + 2;' }
      let(:tokens) do
        [
          [:identifier, 'x'],
          [:space, ' '],
          [:assignment, '='],
          [:space, ' '],
          [:integer, '1'],
          [:space, ' '],
          [:identifier, '+'],
          [:space, ' '],
          [:integer, '2'],
          [:semicolon, ';']
        ]
      end

      it 'produces tokens' do
        expect(lexer.tokenize(input)).to eql(tokens)
      end
    end
  end
end
