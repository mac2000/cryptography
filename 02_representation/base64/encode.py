import base64

text = 'Hello world, mac was here'
bytes = text.encode()
b64 = base64.b64encode(bytes).decode()

print(b64)
