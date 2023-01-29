package main

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/base64"
	"encoding/pem"
	"fmt"
	"os"
)

func main() {
	b, err := os.ReadFile("public.pem")
	if err != nil {
		panic(err)
	}
	block, _ := pem.Decode(b)
	publicKey, err := x509.ParsePKIXPublicKey(block.Bytes)
	// publicKey, err := x509.ParsePKCS1PublicKey(block.Bytes)
	if err != nil {
		panic(err)
	}

	text := "Hello world, mac was here"

	encryptedBytes, err := rsa.EncryptPKCS1v15(rand.Reader, publicKey.(*rsa.PublicKey), []byte(text))
	if err != nil {
		panic(err)
	}

	encryptedBase64 := base64.StdEncoding.EncodeToString(encryptedBytes)
	fmt.Println(encryptedBase64)

	err = os.WriteFile("protected.txt", []byte(encryptedBase64), 0644)
	if err != nil {
		panic(err)
	}
}
