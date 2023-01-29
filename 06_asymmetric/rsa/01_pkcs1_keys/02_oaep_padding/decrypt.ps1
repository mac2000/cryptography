$rsa = [System.Security.Cryptography.RSA]::Create()
$rsa.ImportFromPem((Get-Content "private.pem" -Raw))

$encrypted = [Convert]::FromBase64String((Get-Content "protected.txt" -Raw))

$decrypted = $rsa.Decrypt($encrypted, [System.Security.Cryptography.RSAEncryptionPadding]::OaepSHA1)

$decoded = [System.Text.Encoding]::UTF8.GetString($decrypted)

Write-Host $decoded
