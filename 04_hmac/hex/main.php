<?php
$text = 'Hello world, mac was here';
$secret = 'Secret used to sign hash';
$hash = bin2hex(hash_hmac('sha256', $text, $secret, true));
echo $hash . PHP_EOL;