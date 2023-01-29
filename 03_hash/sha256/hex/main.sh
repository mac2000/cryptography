#!/bin/sh

text='Hello world, mac was here'
hash=$(echo -n $text | openssl dgst -sha256 -hex | cut -d' ' -f2)

echo $hash