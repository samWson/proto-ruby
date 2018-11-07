package lexer

import (
	"github.com/samwson/proto-ruby/token"
	"testing"
)

func TestLexer(t *testing.T) {
	sourceCode := "x = 1 + 2;"

	tests := []struct {
		expectedType    token.TokenType
		expectedLiteral string
	}{
		{token.IDENTIFIER, "x"},
		{token.ASSIGNMENT, "="},
		{token.INTEGER, "1"},
		{token.IDENTIFIER, "+"},
		{token.INTEGER, "2"},
		{token.SEMICOLON, ";"},
	}

	lexer := New(sourceCode)

	for i, tt := range tests {
		token := lexer.NextToken()

		if token.Type != tt.expectedType {
			t.Fatalf("Tests[%d] - token type wrong. Expected %q, got %q", i, tt.expectedType, token.Type)
		}

		if token.Literal != tt.expectedLiteral {
			t.Fatalf("Tests[%d] - literal wrong. Expected %q, got %q", i, tt.expectedLiteral, token.Literal)
		}
	}
}
