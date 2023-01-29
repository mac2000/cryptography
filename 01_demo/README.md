# Demo

In this demo we are showing different algorythms being implemented in PHP and browsers JavaScript

To run demo use following command:

```bash
docker run -it --rm -v ${PWD}/index.php:/code/index.php -p 8080:8080 -w /code php php -S 0.0.0.0:8080 index.php
```

And open [http://localhost:8080/](http://localhost:8080/)

You will see the results of hash, hmac, aes, rsa

The idea of this demo was to see all that in one place to figure out how its looks like which will help proceeding

