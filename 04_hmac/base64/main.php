<?php
$text = 'Hello world, mac was here';
$secret = 'Secret used to sign hash';
$hash = base64_encode(hash_hmac('sha256', $text, $secret, true));
echo $hash . PHP_EOL;