b64='SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ=='
text=$(echo -n $b64 | base64 -d)
echo $text
