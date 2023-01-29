$text = "Hello world, mac was here"
$bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
$b64 = [Convert]::ToBase64String($bytes).TrimEnd('=').Replace('+', '-').Replace('/', '_');

Write-Host $b64