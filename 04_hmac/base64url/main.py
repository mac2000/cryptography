import hashlib
import hmac
import base64

text = 'Hello world, mac was here'
secret = 'Secret used to sign hash'

hash = base64.urlsafe_b64encode(hmac.new(secret.encode(), text.encode(), hashlib.sha256).digest()).rstrip(b'=').decode()

print(hash)
