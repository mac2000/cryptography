text='Hello world, mac was here'
encrypted=$(echo -n "$text" | openssl rsautl -encrypt -inkey public.pem -pubin -oaep | base64)
echo -n "$encrypted" > protected.txt
echo $encrypted

# -oaep              Use PKCS#1 OAEP padding
# -pkcs              Use PKCS#1 v1.5 padding (default)
# -raw               Use no padding
# -x931              Use ANSI X9.31 padding
