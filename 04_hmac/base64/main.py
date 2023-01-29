import hashlib
import hmac
import base64

text = 'Hello world, mac was here'
secret = 'Secret used to sign hash'

hash = base64.b64encode(hmac.new(secret.encode(), text.encode(), hashlib.sha256).digest()).decode()

print(hash)
