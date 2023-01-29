const crypto = require('crypto')

const text = 'Hello world, mac was here'
const key = 'must_be_exactly_32_chars_long_00'
const iv = '16_random_chars_'

const cipher = crypto.createCipheriv('aes-256-cbc', Buffer.from(key, 'utf8'), Buffer.from(iv, 'utf8'))
const bytes = Buffer.concat([cipher.update(text, 'utf8'), cipher.final()]);

console.log(bytes.toString('base64'))
