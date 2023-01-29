import hashlib

text = 'Hello world, mac was here'
hash = hashlib.sha256(text.encode()).hexdigest()

print(hash)