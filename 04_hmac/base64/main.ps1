$text = "Hello world, mac was here"
$secret = "Secret used to sign hash";

$hasher = New-Object System.Security.Cryptography.HMACSHA256
$hasher.Key = [System.Text.Encoding]::UTF8.GetBytes($secret)

$hash = [Convert]::ToBase64String($hasher.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($text)))

Write-Host $hash