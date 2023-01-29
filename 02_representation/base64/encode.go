package main

import (
	"encoding/base64"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	bytes := []byte(text)
	b64 := base64.StdEncoding.EncodeToString(bytes)
	fmt.Println(b64)
}
