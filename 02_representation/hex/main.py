import hashlib

text = 'Hello world, mac was here'
bytes = text.encode()
hex = bytes.hex()

print(hex)