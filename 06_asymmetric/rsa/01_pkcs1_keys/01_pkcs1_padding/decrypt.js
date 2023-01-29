const crypto = require('crypto')
const fs = require('fs')

const encrypted = Buffer.from(fs.readFileSync('protected.txt', 'utf8'), 'base64')

const privateKey = crypto.createPrivateKey(fs.readFileSync('private.pem', 'utf8'))

const decrypted = crypto.privateDecrypt({key: privateKey, padding: crypto.constants.RSA_PKCS1_PADDING}, Buffer.from(encrypted, 'base64'))
// const decrypted = crypto.privateDecrypt(privateKey, Buffer.from(encrypted, 'base64'))

console.log(decrypted.toString('utf8'))

// crypto.constants.RSA_PKCS1_PADDING
// crypto.constants.RSA_SSLV23_PADDING
// crypto.constants.RSA_NO_PADDING
// crypto.constants.RSA_PKCS1_OAEP_PADDING
// crypto.constants.RSA_X931_PADDING
// crypto.constants.RSA_PKCS1_PSS_PADDING
