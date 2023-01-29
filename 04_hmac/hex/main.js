const text = 'Hello world, mac was here'
const secret = 'Secret used to sign hash'

const hash = require('crypto').createHmac('sha256', secret).update(text).digest('hex')

console.log(hash)