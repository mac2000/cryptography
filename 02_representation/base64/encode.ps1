$text = "Hello world, mac was here"
$bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
$b64 = [Convert]::ToBase64String($bytes)

Write-Host $b64