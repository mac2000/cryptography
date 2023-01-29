$text = "Hello world, mac was here"
$key = "must_be_exactly_32_chars_long_00"
$iv = "16_random_chars_"

$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.KeySize = 256
$aes.Key = [System.Text.Encoding]::UTF8.GetBytes($key)
$aes.IV = [System.Text.Encoding]::UTF8.GetBytes($iv)

$ms = New-Object System.IO.MemoryStream
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateEncryptor(), [System.Security.Cryptography.CryptoStreamMode]::Write)
$sw = New-Object System.IO.StreamWriter($cs)

$sw.Write($text)
$sw.Flush()
$cs.Flush()
$ms.Flush()
$cs.Dispose()
$sw.Dispose()

$bytes = $ms.ToArray()
$encoded = [Convert]::ToBase64String($bytes)

Write-Host $encoded
