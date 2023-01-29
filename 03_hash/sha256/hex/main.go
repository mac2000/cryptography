package main

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	hasher := sha256.New()
	hasher.Write([]byte(text))
	hash := hex.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
