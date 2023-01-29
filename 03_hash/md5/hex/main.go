package main

import (
	"crypto/md5"
	"encoding/hex"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	hasher := md5.New()
	hasher.Write([]byte(text))
	hash := hex.EncodeToString(hasher.Sum(nil))
	fmt.Println(hash)
}
