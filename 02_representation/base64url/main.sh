text='Hello world, mac was here'
b64=$(echo -n $text | base64 | tr '/+' '_-' | tr -d '=')
echo $b64