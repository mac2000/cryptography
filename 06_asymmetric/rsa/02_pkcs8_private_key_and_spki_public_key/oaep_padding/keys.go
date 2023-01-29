package main

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/pem"
	"os"
)

func main() {

	privateKey, err := rsa.GenerateKey(rand.Reader, 2048)
	if err != nil {
		panic(err)
	}

	privateFile, err := os.Create("private.pem")
	if err != nil {
		panic(err)
	}

	b, err := x509.MarshalPKCS8PrivateKey(privateKey)
	if err != nil {
		panic(err)
	}

	privateBlock := &pem.Block{
		Type:  "PRIVATE KEY",
		Bytes: b,
	}

	err = pem.Encode(privateFile, privateBlock)
	if err != nil {
		panic(err)
	}

	publicKey := &privateKey.PublicKey

	publicFile, err := os.Create("public.pem")
	if err != nil {
		panic(err)
	}

	b, err = x509.MarshalPKIXPublicKey(publicKey)
	if err != nil {
		panic(err)
	}

	publicBlock := &pem.Block{
		Type:  "PUBLIC KEY",
		Bytes: b,
	}

	err = pem.Encode(publicFile, publicBlock)
	if err != nil {
		panic(err)
	}

}
