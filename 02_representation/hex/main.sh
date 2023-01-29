text='Hello world, mac was here'
hex=$(echo -n $text | xxd -p -c32)
echo $hex