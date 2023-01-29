package main

import (
	"encoding/base64"
	"fmt"
)

func main() {
	b64 := "SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ=="
	bytes, err := base64.StdEncoding.DecodeString(b64)
	if err != nil {
		panic(err)
	}
	text := string(bytes)
	fmt.Println(text)
}
