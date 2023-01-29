const fs = require('fs')
const crypto = require('crypto')

const {privateKey, publicKey} = crypto.generateKeyPairSync('rsa', {
    modulusLength: 2048,
    publicKeyEncoding: {
        type: 'spki', // pkcs1 - not works with openssl, spki - works with openssl
        format: 'pem'
    },
    privateKeyEncoding: {
        type: 'pkcs8', // pkcs1, pkcs8
        format: 'pem',
        // cipher: 'aes-256-cbc',
        // passphrase: 'P@ssw0rd',
    }
})

fs.writeFileSync('private.pem', privateKey, 'utf8')
fs.writeFileSync('public.pem', publicKey, 'utf8')

// const text = 'Hello world, mac was here'

// const encrypted = crypto.privateEncrypt(privateKey, Buffer.from(text, 'utf8'))
// // console.log(encrypted.toString('base64'))

// const descrypted = crypto.publicDecrypt(publicKey, encrypted)
// console.log(descrypted.toString('utf8'))
