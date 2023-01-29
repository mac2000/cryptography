package main

import (
	"crypto/aes"
	"crypto/cipher"
	"encoding/base64"
	"fmt"
)

func main() {
	encryptedBase64 := "zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM="
	key := "must_be_exactly_32_chars_long_00"
	iv := "16_random_chars_"

	ciphertext, err := base64.StdEncoding.DecodeString(encryptedBase64)
	if err != nil {
		panic(err)
	}

	block, err := aes.NewCipher([]byte(key))
	if err != nil {
		panic(err)
	}

	if len(ciphertext)%aes.BlockSize != 0 {
		panic("ciphertext is not a multiple of the block size")
	}

	mode := cipher.NewCBCDecrypter(block, []byte(iv))
	mode.CryptBlocks(ciphertext, ciphertext)

	fmt.Printf("%s\n", ciphertext)
}
