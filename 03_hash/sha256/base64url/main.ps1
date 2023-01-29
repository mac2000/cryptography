$text = "Hello world, mac was here"

$hash = [Convert]::ToBase64String([System.Security.Cryptography.SHA256]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($text))).TrimEnd('=').Replace('+', '-').Replace('/', '_')

Write-Host $hash