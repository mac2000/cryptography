# RSA

Rivest-Shamir-Adleman - names of inventors

You gonna need pair of keys

- public key is used to encrypt data
- private key is used to decrypt data
- keys can be generated on the fly and exchanged between participants
- one private key can have many public keys
- ideally keys may be generated on the fly, then participants exchanging public keys for further encryption


## Encrypt with public key, decrypt with private key

Originaly I was thinking differently, if I'm the server and want to send something encrypted to client it means that I need to encrypt it with public key and share private key to all clients - which makes no sense at all. But it is wrong, if we want send something encrypted to the client we need to use his public key instead, which means after encrypting, nobody, even we, wont be able to decrypt message

Some implementations (node, php) allows us to do it in reverse, e.g. encrypt data with private key and decrypt it with public key

But it does not make much sence, because public key is public and technically can be publicly available then what is the sence of encrypting and sending something to the client in the hope that he did not publish his public key


## Message size

The drawback of RSA is that message size is limited to key size, e.g. you wont be able to encrypt big file, for that consider AES

Usually workflow is to exchange AES secret with help of RSA and then transfer the body encrypted with AES - check out the "fun" demo


## PKCS1 vs PKCS8

In majority of implementations you may see this `PKCS1` and `PKCS8`

From my understanding `PKCS1` is something old and not implemented everywhere, it is used for both private and public keys (and probably thats why we may reverse encrypt decrypt with different keys)

`PKCS1` private key has `-----BEGIN RSA PRIVATE KEY-----` header and its public key still has `-----BEGIN PUBLIC KEY-----` header

`PKCS8` may be used only for private keys and has `-----BEGIN PRIVATE KEY-----` header, its public key is most ofter will be mentioned as `spki` which is an abbreviation for "Subject Public Key Info" which is a format only for public keys, and they will have `-----BEGIN PUBLIC KEY-----` header

While trying to find something that will work everywhere it seems that private keys in `PKCS8`, public keys in `SPKI` and `OAEP` encryption/decryption wins

There is a way to migrate pkcs1 private key to pkcs8 like so:

```bash
openssl pkcs8 -topk8 -inform PEM -outform PEM -nocrypt -in private.pkcs1.pem -out private.pkcs8.pem
```

## OAEP vs PKCS1

The same way as with keys actual encryption and decryption has different paddings `oaep` and `pkcs1`

From my understanding `pkcs1` is older one and not implemented everywhere anymore

On the other hand `oaep` seems to be implemented everywhere including browser javascript

This padding should be independant on keys but should match on both sides of participants of encryption decryption


## Demos

In subdirectories you will find examples of different approaches, but not everywhere we can implement everything, e.g. browser does not support pkcs1

In each demo there is a 3 set of samples

- keys - demonstrating how to create and export keys, so they may be used by others
- encrypt - encrypt given text and save it to `protected.txt` with given public key
- decrypt - decrypt protected text with given private key

Idea here is that I should be able to:

- create keys with help of Go
- encryp text with PHP
- decrypt it with C#

and it should work for all that combinations

The key thing here is to not relay on defaults which are different in all languages and it makes everything so hard to align, but once you started to understand what things are configurable and configure them same way everything starts to work

Also there are samples for browser but they require some manual work, for them it is better to see very first and last demos

## Tests

Each folder has `test.ps1` script to check that everything works as expected by iterating over all keys, encrypt, decrypt combinations

## Other usages

From given private key we may:

- create as many public keys as we want for all this encryption
- [create certificates for https](https://mac-blog.org.ua/openssl-ca-key-csr-crt)
- [create signed certificates for https](https://mac-blog.org.ua/openssl-ca-key-csr-crt-san)
- [create signed certificate inside kubernetes for user kubectl](https://mac-blog.org.ua/kubernetes-create-user-kubectl)
- after conversion we may use it for ssh
