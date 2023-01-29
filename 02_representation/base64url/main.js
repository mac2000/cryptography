const text = 'Hello world, mac was here'

const bytes = Buffer.from(text)

const b64 = bytes.toString('base64url')

console.log(b64)