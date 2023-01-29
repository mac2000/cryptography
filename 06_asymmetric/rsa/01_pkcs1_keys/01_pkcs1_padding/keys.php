<?php

$keys = openssl_pkey_new(["private_key_bits" => 2048, "private_key_type" => OPENSSL_KEYTYPE_RSA]);
$public_key_pem = openssl_pkey_get_details($keys)['key'];
openssl_pkey_export($keys, $private_key_pem);
    
file_put_contents("public.pem", $public_key_pem);
file_put_contents("private.pem", $private_key_pem);
