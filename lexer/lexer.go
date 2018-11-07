package lexer

import "github.com/samwson/proto-ruby/token"

type Lexer struct {
	input        string
	position     int
	readPosition int
	character    byte
}

func New(input string) *Lexer {
	lexer := &Lexer{input: input}
	lexer.readChar()
	return lexer
}

func (lexer *Lexer) NextToken() token.Token {
	var tok token.Token

	lexer.skipWhitespace()

	switch lexer.character {
	case '=':
		tok = newToken(token.ASSIGNMENT, lexer.character)
	case ';':
		tok = newToken(token.SEMICOLON, lexer.character)
	case 0:
		tok.Literal = ""
		tok.Type = token.EOF
	default:
		if isLetter(lexer.character) {
			return token.Token{Type: token.IDENTIFIER, Literal: lexer.readIdentifier()}
		} else if isDigit(lexer.character) {
			return token.Token{Type: token.INTEGER, Literal: lexer.readNumber()}
		} else {
			tok = newToken(token.ILLEGAL, lexer.character)
		}
	}

	lexer.readChar()
	return tok
}

func (lexer *Lexer) readChar() {
	if lexer.readPosition >= len(lexer.input) {
		lexer.character = 0
	} else {
		lexer.character = lexer.input[lexer.readPosition]
	}

	lexer.position = lexer.readPosition
	lexer.readPosition += 1
}

func (lexer *Lexer) skipWhitespace() {
	for lexer.character == ' ' || lexer.character == '\n' || lexer.character == '\t' || lexer.character == '\r' {
		lexer.readChar()
	}
}

func newToken(tokenType token.TokenType, character byte) token.Token {
	return token.Token{Type: tokenType, Literal: string(character)}
}

func (lexer *Lexer) readIdentifier() string {
	index := lexer.position

	for isLetter(lexer.character) {
		lexer.readChar()
	}

	return lexer.input[index:lexer.position]
}

func isLetter(character byte) bool {
	return 'a' <= character && character <= 'z' || 'A' <= character && character <= 'Z' || character == '_' || isOperator(character)
}

func isOperator(ch byte) bool {
	return ch == '+'
}

func (lexer *Lexer) readNumber() string {
	index := lexer.position

	for isDigit(lexer.character) {
		lexer.readChar()
	}

	return lexer.input[index:lexer.position]
}

func isDigit(character byte) bool {
	return '0' <= character && character <= '9'
}
