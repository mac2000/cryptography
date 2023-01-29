import hashlib

text = 'Hello world, mac was here'
hash = hashlib.md5(text.encode()).hexdigest()

print(hash)