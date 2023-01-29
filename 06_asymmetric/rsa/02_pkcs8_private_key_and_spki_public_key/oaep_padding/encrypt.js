const crypto = require('crypto')
const fs = require('fs')

const text = 'Hello world, mac was here'

const publicKey = crypto.createPublicKey(fs.readFileSync('public.pem', 'utf8'))

const encrypted = crypto.publicEncrypt({ key: publicKey, padding: crypto.constants.RSA_PKCS1_OAEP_PADDING }, Buffer.from(text, 'utf8'))

fs.writeFileSync('protected.txt', encrypted.toString('base64'), 'utf8')
console.log(encrypted.toString('base64'))

// crypto.constants.RSA_PKCS1_PADDING - openssl oaep
// crypto.constants.RSA_SSLV23_PADDING
// crypto.constants.RSA_NO_PADDING
// crypto.constants.RSA_PKCS1_OAEP_PADDING - openssl pkcs
// crypto.constants.RSA_X931_PADDING
// crypto.constants.RSA_PKCS1_PSS_PADDING
