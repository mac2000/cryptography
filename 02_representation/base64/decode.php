<?php
$b64 = 'SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ==';
$text = base64_decode($b64);
echo $text . PHP_EOL;