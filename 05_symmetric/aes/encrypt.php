<?php
$text = "Hello world, mac was here";
$key = "must_be_exactly_32_chars_long_00";
$iv = "16_random_chars_";

$encryptedBase64 = openssl_encrypt($text, 'AES-256-CBC', $key, 0, $iv);

echo $encryptedBase64 . PHP_EOL;