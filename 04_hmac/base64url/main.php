<?php
$text = 'Hello world, mac was here';
$secret = 'Secret used to sign hash';
$hash = rtrim(strtr(base64_encode(hash_hmac('sha256', $text, $secret, true)), '+/', '-_'), '=');
echo $hash . PHP_EOL;