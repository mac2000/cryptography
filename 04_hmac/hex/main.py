import hashlib
import hmac
import base64

text = 'Hello world, mac was here'
secret = 'Secret used to sign hash'

hash = hmac.new(secret.encode(), text.encode(), hashlib.sha256).hexdigest()

print(hash)
