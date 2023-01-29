$text = "Hello world, mac was here"
$secret = "Secret used to sign hash";

$hasher = New-Object System.Security.Cryptography.HMACSHA256
$hasher.Key = [System.Text.Encoding]::UTF8.GetBytes($secret)

$hash = [BitConverter]::ToString($hasher.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($text))).Replace("-", "").ToLower()

Write-Host $hash