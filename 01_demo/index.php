<?php
$text = "Hello world, mac was here";
$salt1 = "some random text";
$salt2 = "another salt";
$secret = "secret used to sign hash";
$key = "must_be_exactly_32_chars_long_00";
$iv = "16_random_chars_";
$keys = openssl_pkey_new(["private_key_bits" => 2048, "private_key_type" => OPENSSL_KEYTYPE_RSA]);
$public_key_pem = openssl_pkey_get_details($keys)['key'];
openssl_pkey_export($keys, $private_key_pem);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>browser demos</title>
</head>
<body>
    <h1>Intro</h1>

    <p>Demos for hash, hmac, aes and rsa</p>
    <p>The idea here is to see them in action to have an feel whats it is looks like</p>

    <h1>Hash</h1>
    <h2>SHA256</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>text</th>
                <th>backend (base64 encoded)</th>
                <th>frontend (base64 encoded)</th>
                <th>compare</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $text; ?></td>
                <td>
                    <code id="backend1_sha256"><?php 
                        echo base64_encode(hash('sha256', $text, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend1_sha256"></code>
                    <script>
                        var text = `<?php echo $text; ?>`
                        var encoder = new TextEncoder()
                        crypto.subtle.digest({name: "SHA-256"}, encoder.encode(text))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend1_sha256').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare1_sha256').innerHTML = backend1_sha256.innerText == frontend1_sha256.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare1_sha256"></div>
                </td>
            </tr>
            <tr>
                <td><?php echo $text; ?></td>
                <td>
                    <code id="backend2_sha256"><?php 
                        echo base64_encode(hash('sha256', $text, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend2_sha256"></code>
                    <script>
                        var text = `<?php echo $text; ?>`
                        var encoder = new TextEncoder()
                        crypto.subtle.digest({name: "SHA-256"}, encoder.encode(text))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend2_sha256').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare2_sha256').innerHTML = backend2_sha256.innerText == frontend2_sha256.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare2_sha256"></div>
                </td>
            </tr>
        </tbody>
    </table>

    <p>No matter how many times it will be called, results will be always the same for same inputs.</p>

    <h2>SHA256 + Salt</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>text</th>
                <th>salt</th>
                <th>backend (base64 encoded)</th>
                <th>frontend (base64 encoded)</th>
                <th>compare</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $text; ?></td>
                <td><?php echo $salt1; ?></td>
                <td>
                    <code id="backend_sha256_salt1"><?php 
                        echo base64_encode(hash('sha256', $salt1 . $text, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend_sha256_salt1"></code>
                    <script>
                        var salt = `<?php echo $salt1; ?>`
                        var text = `<?php echo $text; ?>`
                        var encoder = new TextEncoder()
                        crypto.subtle.digest({name: "SHA-256"}, encoder.encode(salt + text))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend_sha256_salt1').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare_sha256_salt1').innerHTML = backend_sha256_salt1.innerText == frontend_sha256_salt1.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare_sha256_salt1"></div>
                </td>
            </tr>
            <tr>
                <td><?php echo $text; ?></td>
                <td><?php echo $salt2; ?></td>
                <td>
                    <code id="backend_sha256_salt2"><?php 
                        echo base64_encode(hash('sha256', $salt2 . $text, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend_sha256_salt2"></code>
                    <script>
                        var salt = `<?php echo $salt2; ?>`
                        var text = `<?php echo $text; ?>`
                        var encoder = new TextEncoder()
                        crypto.subtle.digest({name: "SHA-256"}, encoder.encode(salt + text))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend_sha256_salt2').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare_sha256_salt2').innerHTML = backend_sha256_salt2.innerText == frontend_sha256_salt2.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare_sha256_salt2"></div>
                </td>
            </tr>
        </tbody>
    </table>

    <p>&quot;A salt is added to the hashing process to force their uniqueness, increase their complexity without increasing user requirements, and to mitigate password attacks like hash tables&quot; &mdash; <a href="https://auth0.com/blog/adding-salt-to-hashing-a-better-way-to-store-passwords/">Adding Salt to Hashing: A Better Way to Store Passwords</a></blockquote>

    <h2>HMAC</h2>

    <p>Hash-based message authentication code (HMAC)</p>

    <p>It may be used to simultaneously verify both the data integrity and authenticity of a message</p>

    <p>Most often you see it when working with JWT tokens</p>

    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>text</th>
                <th>secret</th>
                <th>backend (base64 encoded)</th>
                <th>frontend (base64 encoded)</th>
                <th>compare</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><?php echo $text; ?></td>
                <td><?php echo $secret; ?></td>
                <td>
                    <code id="backend1_hmac"><?php 
                        echo base64_encode(hash_hmac('sha256', $text, $secret, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend1_hmac"></code>
                    <script>
                        var secret = `<?php echo $secret; ?>`
                        var text = `<?php echo $text; ?>`
                        
                        crypto.subtle.importKey("raw", encoder.encode(secret), {name: "HMAC", hash: {name: "SHA-256"}}, false, ["sign", "verify"])
                            .then(key => crypto.subtle.sign({name: "HMAC"}, key, new TextEncoder().encode(text)))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend1_hmac').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare1_hmac').innerHTML = backend1_hmac.innerText == frontend1_hmac.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare1_hmac"></div>
                </td>
            </tr>
            <tr>
                <td><?php echo $text; ?></td>
                <td><?php echo $secret; ?></td>
                <td>
                    <code id="backend2_hmac"><?php 
                        echo base64_encode(hash_hmac('sha256', $text, $secret, true)); 
                    ?></code>
                </td>
                <td>
                    <code id="frontend2_hmac"></code>
                    <script>
                        var secret = `<?php echo $secret; ?>`
                        var text = `<?php echo $text; ?>`
                        
                        crypto.subtle.importKey("raw", encoder.encode(secret), {name: "HMAC", hash: {name: "SHA-256"}}, false, ["sign", "verify"])
                            .then(key => crypto.subtle.sign({name: "HMAC"}, key, new TextEncoder().encode(text)))
                            .then(hash => btoa(String.fromCharCode(...new Uint8Array(hash))))
                            .then(b64 => document.getElementById('frontend2_hmac').innerHTML = b64)
                            .then(() => {
                                document.getElementById('compare2_hmac').innerHTML = backend2_hmac.innerText == frontend2_hmac.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
                <td>
                    <div id="compare2_hmac"></div>
                </td>
            </tr>
        </tbody>
    </table>

    <p>It is somehow similar to SHA256 + Salt, that's why results are always same for same inputs</p>

    <h1>Symmetric</h1>
    <h2>AES</h2>
    <p>Advanced Encryption Standard</p>
    <p>May be used to encrypt and decrypt messages of any size, may be streamed</p>
    <p>Key must be shared between both parties, so it is good for internal usage only (e.g.: it is fine to share secret between all your applications but probably you do not want to share it with 3rd party applications)</p>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>name</th>
                <th>value</th>
                <th>notes</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>text</th>
                <td><?php echo $text; ?></td>
                <td></td>
            </tr>
            <tr>
                <th>key</th>
                <td><?php echo $key; ?></td>
                <td>secret used for encryption and decryption, for AES 256 must be exactly 32 bytes</td>
            </tr>
            <tr>
                <th>iv</th>
                <td><?php echo $iv; ?></td>
                <td>must be exactly array of random 16 bytes, used for decryption so should be passed alongside encrypted bytes</td>
            </tr>
            <tr>
                <th>backend (base64)</th>
                <td colspan="2">
                    <code id="backend_aes"><?php 
                        echo openssl_encrypt($text, 'AES-256-CBC', $key, 0, $iv);
                    ?></code>
                </td>
            </tr>
            <tr>
                <th>frontend (base64)</th>
                <td colspan="2">
                    <code id="frontend_aes"></code>
                    <script>
                        var text = `<?php echo $text; ?>`
                        var key = `<?php echo $key; ?>`
                        var iv = `<?php echo $iv; ?>`

                        var encoder = new TextEncoder()
                        var keyBytes = encoder.encode(key)
                        var ivBytes = encoder.encode(iv)  // crypto.getRandomValues(new Uint8Array(16))

                        crypto.subtle.importKey("raw", keyBytes, {name: 'AES-CBC', length: 256}, false, ["encrypt", "decrypt"])
                            .then(secret => crypto.subtle.encrypt({name: "AES-CBC", iv: ivBytes}, secret, encoder.encode(text)))
                            .then(encrypted => btoa(String.fromCharCode(...new Uint8Array(encrypted))))
                            .then(base64 => document.getElementById('frontend_aes').innerHTML = base64)
                            .then(() => {
                                document.getElementById('compare_aes').innerHTML = backend_aes.innerText == frontend_aes.innerText ? 'OK' : 'Failed'
                            })
                    </script>
                </td>
            </tr>
            <tr>
                <th>compare</th>
                <td colspan="2"><div id="compare_aes"></div></td>
            </tr>
        </tbody>
    </table>

    <p>Initialization vector (IV) is somehow similar to Salt from previous examples</p>
    
    <h1>Asymmetric</h1>
    <h2>RSA</h2>
    <p>Rivest-Shamir-Adleman - names of inventors</p>
    <p>Public-key cryptosystem where public key used for encryption and private for decryption, so no need to share secret between participants, e.g. if communicating with 3rd party application</p>
    <p>Single private key may have many public keys</p>
    <table border="1" cellpadding="5" cellspacing="0">
        <thead>
            <tr>
                <th>name</th>
                <th>value</th>
                <th>notes</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>private.pem</th>
                <td><pre><code id="private_key"><?php echo $private_key_pem; ?></code></pre></td>
                <td>PKCS8, PEM, 2048 bits</td>
            </tr>
            <tr>
                <th>public.pem</th>
                <td><pre><code id="public_key"><?php echo $public_key_pem; ?></code></pre></td>
                <td>SPKI, PEM</td>
            </tr>
            <tr>
                <th>text</th>
                <td colspan="2"><?php echo $text; ?></td>
            </tr>
            <tr>
                <th>encrypted, backend, base64</th>
                <td colspan="2"><code id="encrypted1_backend" style="word-break: break-all;"><?php 
                    openssl_public_encrypt($text, $encrypted, $public_key_pem, OPENSSL_PKCS1_OAEP_PADDING); 
                    echo base64_encode($encrypted); 
                ?></code></td>
            </tr>
            <tr>
                <th>encrypted, frontend, base64</th>
                <td colspan="2">
                    <code id="encrypted1_frontend" style="word-break: break-all;"></code>
                    <script>
                        var text = `<?php echo $text; ?>`
                        var publicKeyPem = `<?php echo $public_key_pem; ?>`
                        
                        var encoder = new TextEncoder()
                        crypto.subtle.importKey(
                            "spki",
                            Uint8Array.from(atob(publicKeyPem.split('\n').filter(line => !line.startsWith('-----')).join('')), c => c.charCodeAt(0)), // encoder.encode(publicKeyPem),
                            {name: "RSA-OAEP", hash: {name: "SHA-1"}},
                            false,
                            ["encrypt"]
                        ).then(publicKey => crypto.subtle.encrypt({name: "RSA-OAEP"}, publicKey, encoder.encode(text)))
                        .then(encrypted => btoa(String.fromCharCode(...new Uint8Array(encrypted))))
                        .then(base64 => document.getElementById('encrypted1_frontend').innerHTML = base64)
                    </script>
                </td>
            </tr>
            <tr>
                <th>backend decrypt backend</th>
                <td colspan="2"><code id="decrypted1_backend" style="word-break: break-all;"><?php 
                    openssl_private_decrypt($encrypted, $decrypted, $private_key_pem, OPENSSL_PKCS1_OAEP_PADDING);	
                    echo $decrypted; 
                ?></code></td>
            </tr>
            <tr>
                <th>frontend decrypt backend</th>
                <td colspan="2">
                    <code id="decrypted1_frontend" style="word-break: break-all;"></code>
                    <script>
                        var encryptedBase64String = `<?php echo base64_encode($encrypted); ?>`;
        
                        var privateKeyPem = `<?php echo $private_key_pem; ?>`
                        
                        crypto.subtle.importKey(
                            "pkcs8",
                            Uint8Array.from(atob(privateKeyPem.split('\n').filter(line => !line.startsWith('-----')).join('')), c => c.charCodeAt(0)), // encoder.encode(publicKeyPem),
                            {name: "RSA-OAEP", hash: {name: "SHA-1"}},
                            false,
                            ["decrypt"]
                        ).then(privateKey => crypto.subtle.decrypt({name: "RSA-OAEP"}, privateKey, Uint8Array.from(atob(encryptedBase64String), c => c.charCodeAt(0))))
                        .then(decryptedBytes => new TextDecoder('utf8').decode(decryptedBytes))
                        .then(text => document.getElementById('decrypted1_frontend').innerHTML = text)
                    </script>
                </td>
            </tr>
            <tr>
                <th>frontend decrypt frontend</th>
                <td colspan="2">
                    <code id="decrypted2_frontend" style="word-break: break-all;"></code>
                    <script>
                        setTimeout(() => {
                            var encryptedBase64String = document.getElementById('encrypted1_frontend').innerText.trim()
                            
                            var privateKeyPem = `<?php echo $private_key_pem; ?>`
                            
                            crypto.subtle.importKey(
                                "pkcs8",
                                Uint8Array.from(atob(privateKeyPem.split('\n').filter(line => !line.startsWith('-----')).join('')), c => c.charCodeAt(0)), // encoder.encode(publicKeyPem),
                                {name: "RSA-OAEP", hash: {name: "SHA-1"}},
                                false,
                                ["decrypt"]
                            ).then(privateKey => crypto.subtle.decrypt({name: "RSA-OAEP"}, privateKey, Uint8Array.from(atob(encryptedBase64String), c => c.charCodeAt(0))))
                            .then(decryptedBytes => new TextDecoder('utf8').decode(decryptedBytes))
                            .then(text => document.getElementById('decrypted2_frontend').innerHTML = text)
                            .then(() => {
                                // WTF?!: decrypted1_backend.innerText === decrypted1_frontend.innerText === decrypted2_frontend.innerText - gives false
                                compare_rsa.innerHTML = new Set([decrypted1_backend.innerText, decrypted1_frontend.innerText, decrypted2_frontend.innerText]).size === 1 ? 'OK' : 'Fail'
                            })
                        }, 100)
                    </script>
                </td>
            </tr>
            <tr>
                <th>compare</th>
                <td colspan="2"><div id="compare_rsa"></div></td>
            </tr>
        </tbody>
    </table>

    <p>Event so encryption results are different each time we may decrypt it with given private key on any platform</p>
    <p>We can not encrypt message longer than key size, for big messages use AES instead, and use RSA to transfer key</p>

</body>
</html>