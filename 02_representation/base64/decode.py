import base64

b64 = 'SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ=='
text = base64.b64decode(b64).decode()

print(text)
