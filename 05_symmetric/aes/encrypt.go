package main

import (
	"bytes"
	"crypto/aes"
	"crypto/cipher"
	"encoding/base64"
	"fmt"
)

func main() {
	text := "Hello world, mac was here"
	key := "must_be_exactly_32_chars_long_00"
	iv := "16_random_chars_"

	padded := PKCS5Padding([]byte(text), aes.BlockSize, len(text))
	b, err := aes.NewCipher([]byte(key))
	if err != nil {
		panic(err)
	}
	ciphertext := make([]byte, len(padded))
	mode := cipher.NewCBCEncrypter(b, []byte(iv))
	mode.CryptBlocks(ciphertext, padded)

	b64 := base64.StdEncoding.EncodeToString(ciphertext)
	fmt.Println(b64)
}

func PKCS5Padding(ciphertext []byte, blockSize int, after int) []byte {
	padding := (blockSize - len(ciphertext)%blockSize)
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(ciphertext, padtext...)
}
