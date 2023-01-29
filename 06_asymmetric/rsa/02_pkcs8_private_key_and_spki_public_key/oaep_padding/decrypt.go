package main

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/sha1"
	"crypto/x509"
	"encoding/base64"
	"encoding/pem"
	"fmt"
	"os"
)

func main() {
	b, err := os.ReadFile("private.pem")
	if err != nil {
		panic(err)
	}
	block, _ := pem.Decode(b)
	privateKey, err := x509.ParsePKCS1PrivateKey(block.Bytes)
	if err != nil {
		key, err := x509.ParsePKCS8PrivateKey(block.Bytes) // without that can not consume dotnet private key
		if err != nil {
			panic(err)
		}
		privateKey = key.(*rsa.PrivateKey)
	}

	encrypted, err := os.ReadFile("protected.txt")
	if err != nil {
		panic(err)
	}

	encryptedBytes, err := base64.StdEncoding.DecodeString(string(encrypted))
	if err != nil {
		panic(err)
	}

	decryptedBytes, err := rsa.DecryptOAEP(sha1.New(), rand.Reader, privateKey, encryptedBytes, nil)
	if err != nil {
		panic(err)
	}

	decrypted := string(decryptedBytes)

	fmt.Println(decrypted)
}
