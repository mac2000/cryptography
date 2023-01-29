import hashlib
import base64

text = 'Hello world, mac was here'
hash = base64.b64encode(hashlib.md5(text.encode()).digest()).decode()

print(hash)
