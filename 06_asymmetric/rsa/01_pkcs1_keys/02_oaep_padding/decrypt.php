<?php
$encoded = file_get_contents("protected.txt");
$decoded = base64_decode($encoded);

openssl_private_decrypt($decoded, $decrypted, file_get_contents("private.pem"), OPENSSL_PKCS1_OAEP_PADDING);	

echo $decrypted . PHP_EOL;

// OPENSSL_PKCS1_PADDING, OPENSSL_SSLV23_PADDING, OPENSSL_PKCS1_OAEP_PADDING, OPENSSL_NO_PADDING.