# HMAC

Hash-based message authentication code (HMAC)

It may be used to simultaneously verify both the data integrity and authenticity of a message

Most often you see it when working with JWT tokens

In my understanding it is similar to salting where we are required to provide salt

The same way as HASH, the output will remain the same for same inputs

Once again we have base64, base64url and hex samples just in case

Each directory has its own `demo.sh` script to run everything and check results

Test base64 samples

| decoded                   | encoded                                      |
| ------------------------- | -------------------------------------------- |
| Hello world, mac was here | ZWk2HNlkmRLxMeoKc4DKoQPRASv1HFEW+646rfj7rMg= |
