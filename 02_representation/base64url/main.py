import base64

text = 'Hello world, mac was here'
bytes = text.encode()
b64 = base64.urlsafe_b64encode(bytes).rstrip(b'=').decode()

print(b64)
