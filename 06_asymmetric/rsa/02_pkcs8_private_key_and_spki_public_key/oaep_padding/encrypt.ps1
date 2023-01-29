$rsa = [System.Security.Cryptography.RSA]::Create()
$rsa.ImportFromPem((Get-Content "public.pem" -Raw))

$text = "Hello world, mac was here"

$encrypted = $rsa.Encrypt([System.Text.Encoding]::UTF8.GetBytes($text), [System.Security.Cryptography.RSAEncryptionPadding]::OaepSHA1)

$encoded = [Convert]::ToBase64String($encrypted)

Write-Host $encoded

[System.IO.File]::WriteAllText("protected.txt", $encoded)
