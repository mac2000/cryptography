# Hashing

- Inreversible
- Idempotentant (output is always the same)
- Fixed size (input size does not affect output size)

## Notes

Hashing deals with bytes, but usually we want strings, so often it will be:

- base64
- base64url
- hex

base64url is technically same as base64, but with some chars being replaced so it is url safe (aka can be used as route param)

## Examples

There is two examples for md5 and sha256 they are very similar and after that it should not be a problem to have sha1 or something similar

Each folder has different output formats but once again they are similar and leaved here only for demo purpose

Each sample has demo script which uses docker to run sample app and output the result

## Salt

Hash functions are idempotentant

Which means no matter how many time we call it for same input we will get same output

Which makes hash functions bad for storing something really important, like user credentials

Imagine that my password is "123", and its hash is "xyz"

Then by repetively checking different combinations sooner or later I will be able to guess it

Usually when it comes to storing something really important, like user credentials, salt is used, it is safe to store it as plain text, the key idea here is that before hasing we adding we prepending or appending our salt which makes usage of so  called "rainbow tables" much harder if non possible
