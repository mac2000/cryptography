<?php
$text = 'Hello world, mac was here';
$b64 = rtrim(strtr(base64_encode($text), '+/', '-_'), '=');
echo $b64 . PHP_EOL;