import hashlib
import base64

text = 'Hello world, mac was here'
hash = base64.urlsafe_b64encode(hashlib.md5(text.encode()).digest()).rstrip(b'=').decode()

print(hash)