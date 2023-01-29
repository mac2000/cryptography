text='Hello world, mac was here'
hash=$(echo -n $text | openssl dgst -md5 -binary | openssl enc -base64)
echo $hash
