<?php
$text = "Hello world, mac was here";

openssl_public_encrypt($text, $encrypted, file_get_contents("public.pem"), OPENSSL_PKCS1_OAEP_PADDING);	

$encoded = base64_encode($encrypted);

echo $encoded . PHP_EOL;

file_put_contents("protected.txt", $encoded);

// OPENSSL_PKCS1_PADDING, OPENSSL_SSLV23_PADDING, OPENSSL_PKCS1_OAEP_PADDING, OPENSSL_NO_PADDING.