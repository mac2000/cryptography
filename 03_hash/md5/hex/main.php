<?php
$text = 'Hello world, mac was here';
$hash = bin2hex(hash('md5', $text, true));
echo $hash . PHP_EOL;
