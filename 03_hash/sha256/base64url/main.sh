text='Hello world, mac was here'
hash=$(echo -n $text | openssl dgst -sha256 -binary | openssl enc -base64 | tr '/+' '_-' | tr -d '=')
echo $hash
