package main

import (
	"crypto/md5"
	"encoding/base64"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	hasher := md5.New()
	hasher.Write([]byte(text))
	hash := base64.RawURLEncoding.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
