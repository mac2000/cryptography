const b64 = 'SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ=='

const bytes = Buffer.from(b64, 'base64')

const text = bytes.toString('utf8')

console.log(text)