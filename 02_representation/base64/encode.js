const text = 'Hello world, mac was here'

const bytes = Buffer.from(text, 'utf8')

const b64 = bytes.toString('base64')

console.log(b64)