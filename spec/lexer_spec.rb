require_relative '../src/lexer'

RSpec.describe Lexer do
  describe '#tokenize' do
    let(:lexer) { described_class.new }

    context 'x = 12 + 2;' do
      let(:input) { 'x = 12 + 2;' }
      let(:tokens) do
        [
          [:identifier, 'x'],
          [:space, ' '],
          [:assignment, '='],
          [:space, ' '],
          [:integer, '12'],
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

		context 'multi letter identifiers: big_number = 100_000;' do
			let(:input) { 'big_number = 100_000;' }		
      let(:tokens) do
        [
          [:identifier, 'big_number'],
          [:space, ' '],
          [:assignment, '='],
          [:space, ' '],
          [:integer, '100_000'],
          [:semicolon, ';']
        ]
      end

			it 'produces tokens' do
				expect(lexer.tokenize(input)).to eql(tokens)
			end
		end
  end
end
