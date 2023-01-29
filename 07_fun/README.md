# Having fun

What we have so far:

- hash - for majority it should be something easy and used often
- hmac - something we may use to sign things, like JWT tokens, also nothing new here
- aes - encrypt/decrypt data of any size with a given key and initialization vector (iv)
- rsa - encrypt data of small size with public key and decrypt it back with private key

Whenever we are talking about something on concrete backend service it is not so hard, e.g.:

- use hash+salt to store credentials
- use hmac to sign jwt
- use aes to encrypt user data of any size
- use rsa to encrypt small data

And it is not a problem because in our service config somewhere we have that keys, secrets, etc and just working with them

Whenver we will need to migrate to another language it should not be a problem, because we are using well known examples

But how about following idea:

In this demo we are going to demonstrate how to safely transfer some data between the server and the client without storing any secrets/keys/etc

To run demo:

```bash
docker run -it --rm -p 3000:3000 -v ${PWD}/index.js:/code/index.js -v ${PWD}/index.html:/code/index.html -w /code node node index.js
```

Then opep [http://localhost:3000/](http://localhost:3000/) to see detailed explanation
