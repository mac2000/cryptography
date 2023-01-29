<?php
$encryptedBase64 = "zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM=";
$key = "must_be_exactly_32_chars_long_00";
$iv = "16_random_chars_";

$decrypted = openssl_decrypt($encryptedBase64, 'AES-256-CBC', $key, 0, $iv);

echo $decrypted . PHP_EOL;