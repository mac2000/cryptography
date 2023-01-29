$encrypted = "zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM="
$key = "must_be_exactly_32_chars_long_00"
$iv = "16_random_chars_"

$aes = [System.Security.Cryptography.Aes]::Create()
$aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
$aes.KeySize = 256
$aes.Key = [System.Text.Encoding]::UTF8.GetBytes($key)
$aes.IV = [System.Text.Encoding]::UTF8.GetBytes($iv)

$ms = New-Object System.IO.MemoryStream
$ms.Write([Convert]::FromBase64String($encrypted))
$ms.Seek(0, [System.IO.SeekOrigin]::Begin) | Out-Null
$cs = New-Object System.Security.Cryptography.CryptoStream($ms, $aes.CreateDecryptor(), [System.Security.Cryptography.CryptoStreamMode]::Read)
$sr = New-Object System.IO.StreamReader($cs)

$decrypted = $sr.ReadToEnd()
        
Write-Host $decrypted
