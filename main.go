package main

import (
	"fmt"
	"github.com/samwson/proto-ruby/repl"
	"os"
)

func main() {
	fmt.Printf("Proto Ruby Programming Language\n")
	repl.Start(os.Stdin, os.Stdout)
}
