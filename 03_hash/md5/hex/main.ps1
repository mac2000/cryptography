$text = "Hello world, mac was here"

$hash = [BitConverter]::ToString([System.Security.Cryptography.MD5]::Create().ComputeHash([System.Text.Encoding]::UTF8.GetBytes($text))).Replace("-", "").ToLower()

Write-Host $hash