# AES

Advanced Encryption Standard

May be used to encrypt and decrypt messages of any size, may be streamed

Key must be shared between both parties, so it is good for internal usage only (e.g.: it is fine to share secret between all your applications but probably you do not want to share it with 3rd party applications)
    
Usually you will see something like "aes-256-cbc", where "aes" stands for algorythm name, "256" key size in bit, so it means that key must be exactly 32 bytes in length, "cbc" is cipher mode, there are many of them, aka: ecb, cbc, ctr, ...

Notes:
- most common mode is: cbc
- allowed block (key) sizes: 128 (16), 192 (24), 256 (32)

Also AES requires initialization vector (IV) which always must be exactly 128 bits (16 bytes) and ideally should be generated each time and passed to client as well. In other words it is an required salt. Usually it is prepended to encrypted bytes, so client may extract it

Demos here are working with "aes-256-cbc", text, key and iv are hardcoded in all examples to be sure it works as expected, but because in different implementations we may want different implementations here is short definitions

| what | string                           | base64                                       | hex                                                              |
| ---- | -------------------------------- | -------------------------------------------- | ---------------------------------------------------------------- |
| key  | must_be_exactly_32_chars_long_00 | bXVzdF9iZV9leGFjdGx5XzMyX2NoYXJzX2xvbmdfMDAK | 6d7573745f62655f65786163746c795f33325f63686172735f6c6f6e675f3030 |
| iv   | 16_random_chars_                 | MTZfcmFuZG9tX2NoYXJzXwo=                     | 31365f72616e646f6d5f63686172735f                                 |

| decrypted                 | encrypted (base64)                           |
| ------------------------- | -------------------------------------------- |
| Hello world, mac was here | zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM= |

While we are having same key and initialization vector encrypted version must be the same no matter waht language we are using.

All encrypt demos are printing base64 presentation.


notes:

- key is 32 chars because we are using AES 256 - it must be 32 bytes (32*8=256)
- iv is 16 bytes (which is the block size 128bits (16*8)), should be generated each time and passed with encrypted data just for demo we hardcoded it
- encrypted should be equal for all implementations because of same key and iv

## Padding

AES encrypts data in blocks of 128 bits (think of this as buffering)

The question is: what should we do if data size is less that block size, the rest of bytes should be filled with something, thats where paddings are come into the game

Depending on used padding bytes will be filled differently and if your language allows you to define it make sure that decryption side does support this padding as well

Here is an bash example showing differeces

```bash
text='Hello world, mac was here'
key='must_be_exactly_32_chars_long_00'
iv='16_random_chars_'
keyhex=$(echo -n $key | xxd -p -c32)
ivhex=$(echo -n $iv | xxd -p -c32)
echo -n $text | openssl enc -e -base64 -aes-256-cbc -K $keyhex -iv $ivhex
```


## RSA

RSA can encrypt/decrypt only small amount of data (not bigger than key) and usually is used to encrypt keys that were used to encrypt big data

Here is an example:

```bash
# create key pair
openssl genrsa -out private.pem
openssl rsa -in private.pem -pubout -out public.pem

# working demo for small data
text='Hello world, mac was here'
encrypted=$(echo -n "$text" | openssl rsautl -encrypt -inkey public.pem -pubin -oaep | base64)
echo $encrypted
decrypted=$(echo -n "$encrypted" | openssl base64 -d -A | openssl rsautl -decrypt -inkey private.pem -oaep)
echo $decrypted

# not working example for big data
cat Archive.zip | openssl rsautl -encrypt -inkey public.pem -pubin -oaep -out Archive.zip.encrypted
# data too large for key size

# but works fine with AES
key='must_be_exactly_32_chars_long_00'
iv='16_random_chars_'
keyhex=$(echo -n $key | xxd -p -c32)
ivhex=$(echo -n $iv | xxd -p -c32)

cat Archive.zip | openssl enc -e -aes-256-cbc -K $keyhex -iv $ivhex -out Archive.zip.encrypted

cat Archive.zip.encrypted | openssl enc -d -aes-256-cbc -K $keyhex -iv $ivhex -out Archive.decrypted.zip

zipinfo -t Archive.decrypted.zip
7z t Archive.decrypted.zip
```

But on the other hand RSA does not require from you to pass anything additional with encrypted data (e.g. no need to send IV)
