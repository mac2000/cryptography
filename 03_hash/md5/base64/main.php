<?php
$text = 'Hello world, mac was here';
$hash = base64_encode(hash('md5', $text, true));
echo $hash . PHP_EOL;