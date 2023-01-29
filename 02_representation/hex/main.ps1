$text = "Hello world, mac was here"
$bytes = [System.Text.Encoding]::UTF8.GetBytes($text)
$hash = [BitConverter]::ToString($bytes).Replace("-", "").ToLower()

Write-Host $hash