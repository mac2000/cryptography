# Representation

Everything related to cryptography works with bytes not strings

That's why we need to represent them somehow

Usually you may see:

- base64
- base64url
- hex

In majority of the cases we are going to work with `base64` but, for example, `openssl` wants `hex` for AES so we need to understand how to convert things

Each folder has bunch of examples in different languages

In `demo.sh` you may find an `docker run ...` commands to run them and check results
