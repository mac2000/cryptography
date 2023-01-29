<?php
$text = 'Hello world, mac was here';
$hash = bin2hex(hash('sha256', $text, true));
echo $hash . PHP_EOL;
