package main

import (
	"crypto/sha256"
	"encoding/base64"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	hasher := sha256.New()
	hasher.Write([]byte(text))
	hash := base64.RawURLEncoding.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
