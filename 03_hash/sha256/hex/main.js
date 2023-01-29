const text = 'Hello world, mac was here'

const hash = require('crypto').createHash('sha256').update(text).digest('hex')

console.log(hash)
