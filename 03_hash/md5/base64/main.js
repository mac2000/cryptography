const text = 'Hello world, mac was here'

const hash = require('crypto').createHash('md5').update(text).digest('base64')

console.log(hash)
