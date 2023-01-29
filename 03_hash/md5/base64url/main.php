<?php
$text = 'Hello world, mac was here';
$hash = rtrim(strtr(base64_encode(hash('md5', $text, true)), '+/', '-_'), '=');
echo $hash . PHP_EOL;