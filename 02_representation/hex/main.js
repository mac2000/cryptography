const text = 'Hello world, mac was here'

const bytes = Buffer.from(text)

const hex = bytes.toString('hex')

console.log(hex)