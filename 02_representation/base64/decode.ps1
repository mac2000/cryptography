$b64 = "SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ=="
$text = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($b64))

Write-Host $text