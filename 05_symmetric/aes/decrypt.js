const crypto = require('crypto')

const encrypted = 'zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM='
const key = 'must_be_exactly_32_chars_long_00'
const iv = '16_random_chars_'

const decypher = crypto.createDecipheriv('aes-256-cbc', Buffer.from(key, 'utf8'), Buffer.from(iv, 'utf8'))
const decrypted = Buffer.concat([decypher.update(encrypted, 'base64'), decypher.final()])

console.log(decrypted.toString('utf8'))