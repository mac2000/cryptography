const {createServer} = require('http')
const {readFileSync} = require('fs')
const crypto = require('crypto')

console.log('Creating RSA keys, that will be used for communication with clients')
console.log('Notes:')
console.log('- we are not storing them in files')
console.log('- client will create its own keys and we will exchange public keys')

const {privateKey, publicKey} = crypto.generateKeyPairSync('rsa', {
    modulusLength: 2048,
    publicKeyEncoding: {type: 'spki',format: 'pem'},
    privateKeyEncoding: {type: 'pkcs8', format: 'pem'}
})

console.log(privateKey.substring(0, 60).replace('\n', '') + '...')
console.log(publicKey.substring(0, 60).replace('\n', '') + '...')


function public(req, res) {
    console.log('Got an request for public key')
    res.setHeader("Content-Type", "text/plain")
    res.writeHead(200)
    res.end(publicKey)
}

function home(_, res) {
    console.log('Got home page request, sending index.html')
    res.setHeader("Content-Type", "text/html")
    res.writeHead(200)
    res.end(readFileSync('index.html', 'utf8'))
}

async function transmit(req, res) {
    console.log('Got an request to transmit data')
    console.log('')
    let body = ''
    req.on('data', chunk => body += chunk)
    req.on('end', () => {
        const payload = JSON.parse(body)
        console.log('Payload', payload)
        console.log('')

        let iv = Buffer.from(payload.iv, 'base64')
        console.log('iv is passed as is, base64 encoded')
        console.log('iv: ' + iv.toString('base64'))
        console.log('')

        let key = crypto.privateDecrypt({key: privateKey, padding: crypto.constants.RSA_PKCS1_OAEP_PADDING}, Buffer.from(payload.key, 'base64'))
        console.log('key is encrypted with our public key, so only we can decrypt it with our private key')
        console.log('key: ' + key.toString('base64'))
        console.log('')

        const decryptor = crypto.createDecipheriv('aes-256-cbc', key, iv)
        const text = Buffer.concat([decryptor.update(payload.text, 'base64'), decryptor.final()]).toString('utf8')
        console.log('text inside payload is encrypted with key and iv')
        console.log('and because key is encrypted, no one except us can decrypt text')
        console.log('text: ' + text)
        console.log('')

        console.log('having that text we may want to save/encrypt/store it somewhere')
        console.log('now we need to send response to the client')
        console.log('just for demo we are going to send him text')
        console.log('but to do it safely we also need to encrypt it')
        console.log('thats why client send us its public key')
        console.log('so we are going to encrypt data with it so only client can decrypt it')
        console.log('but once again, rsa can not be used to encrypt big data')
        console.log('thats why we are going to do everything similar to what client did:')
        console.log('- create some random key and iv')
        console.log('- aes encrypt text with this key and iv')
        console.log('- encrypt key with client public key so only he can decrypt it')
        console.log('- respond with similar payload')
        console.log('')

        console.log('Generate new random key and iv')
        key = crypto.randomBytes(32)
        console.log('key: ' + key.toString('base64'))
        iv = crypto.randomBytes(16)
        console.log('iv: ' + iv.toString('base64'))
        console.log('')

        console.log('Encrypt text')
        const encryptor = crypto.createCipheriv('aes-256-cbc', key, iv)
        const encrypted = Buffer.concat([encryptor.update(text, 'utf8'), encryptor.final()]).toString('base64');
        console.log('encrypted: ' + encrypted)
        console.log('')

        console.log('Encrypt key')
        const publicKey = crypto.createPublicKey(payload.publicKey)
        const encryptedKey = crypto.publicEncrypt({ key: publicKey, padding: crypto.constants.RSA_PKCS1_OAEP_PADDING }, key)
        console.log('encrypted key: ' + encryptedKey.toString('base64'))
        console.log('')

        const response = {
            key: encryptedKey.toString('base64'),
            iv: iv.toString('base64'),
            text: encrypted
        }
        console.log('Response', JSON.stringify(response, null, 4))
        console.log('Notes:')
        console.log('- aes key is encrypted with client public rsa key, so only he can decrypt it')
        console.log('- iv sent as is')
        console.log('- text encrypted with aes key')
        console.log('- we are not sending our public key, because client already has it')

        res.setHeader("Content-Type", "application/json")
        res.writeHead(200)
        res.end(JSON.stringify(response))
    })
}


async function router(req, res) {
    switch(req.url) {
        case '/': return home(req, res)
        case '/public': return public(req, res)
        case '/transmit': return await transmit(req, res)
    }
    res.writeHead(404)
    res.end('Not found')
}

const server = createServer(router)

server.listen(3000, '0.0.0.0', () => console.log('Server started and listening 0.0.0.0:3000, open http://localhost:3000/'))