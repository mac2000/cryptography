openssl genpkey -algorithm RSA -out private.pem -pkeyopt rsa_keygen_bits:2048
openssl pkey -in private.pem -pubout -out public.pem
# openssl genrsa -out private.pem 2048
# openssl rsa -in private.pem -pubout -out public.pem

# text='Hello world, mac was here'
# encrypted=$(echo -n "$text" | openssl rsautl -encrypt -inkey public.pem -pubin -pkcs | base64)
# # echo $encrypted
# decrypted=$(echo -n "$encrypted" | base64 -d | openssl rsautl -decrypt -inkey private.pem -pkcs)
# echo $decrypted
