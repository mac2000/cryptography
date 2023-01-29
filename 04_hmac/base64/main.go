package main

import (
	"crypto/hmac"
	"crypto/sha256"
	"encoding/base64"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	secret := "Secret used to sign hash"
	hasher := hmac.New(sha256.New, []byte(secret))
	hasher.Write([]byte(text))
	hash := base64.StdEncoding.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
