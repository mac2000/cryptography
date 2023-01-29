package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	bytes := []byte(text)
	hex := hex.EncodeToString(bytes)
	fmt.Println(hex)
}
