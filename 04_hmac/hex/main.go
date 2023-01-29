package main

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	secret := "Secret used to sign hash"
	hasher := hmac.New(sha256.New, []byte(secret))
	hasher.Write([]byte(text))
	hash := hex.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
