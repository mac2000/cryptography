text='Hello world, mac was here'
secret='Secret used to sign hash'
# TODO: does not work if secret is passed as variable
hash=$(echo -n $text | openssl dgst -sha256 -hmac 'Secret used to sign hash' -hex | cut -d' ' -f2)

echo $hash

