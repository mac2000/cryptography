
text='Hello world, mac was here'
secret='Secret used to sign hash'

echo -n $text | openssl enc -base64 -e -aes-256-cbc -salt -pass "pass:$secret" -pbkdf2
echo U2FsdGVkX1+9SA1X8OKmXsWVQNmKol2CC4G3kAND2Xs9Ay0tRjq6T5RW6iTSJQK1 | openssl enc -base64 -d -aes-256-cbc -salt -pass "pass:$secret" -pbkdf2

echo -n $text | openssl enc -base64 -e -aes-256-cbc -nosalt -pass "pass:$secret" -pbkdf2
echo 5kINa3iMwLOAT0nopYsFJXwdoGx3Bn/z24pVngTlC4U= | openssl enc -base64 -d -aes-256-cbc -nosalt -pass "pass:$secret" -pbkdf2


echo -n $text | openssl enc -base64 -e -aes-256-cbc -pass "pass:$secret" -pbkdf2
echo U2FsdGVkX18PCXYvEvmi+89BttFtB2k/s8+BaqF0bY43+uAPvNHKAozaE2Ltf/0c | openssl enc -base64 -d -aes-256-cbc -pass "pass:$secret" -pbkdf2

echo -n $text | openssl enc -base64 -e -aes-256-cbc -pass "pass:$secret"
echo U2FsdGVkX19x559wPmJwLTUSCjHFBc9QUO2pRaChgbaCnDEFekosxCQsEIEiwSdf | openssl enc -base64 -d -aes-256-cbc -pass "pass:$secret"


encrypted=$(echo -n $text | openssl enc -base64 -e -aes-256-cbc -pass "pass:$secret")
decrypted=$(echo $encrypted | openssl enc -base64 -d -aes-256-cbc -pass "pass:$secret")
echo $encrypted
echo $decrypted


echo -n Nbgn4c0OEzFJzcv37tm4xxXu8tG3vbUSMyNGcKeQ/FI=  | openssl enc -base64 -d -aes-256-cbc -pass "pass:$secret"
echo -n AXenwYoLpuBd5tzgMpSXIHbDyRC1Y1ze/+strRsncBo= | base64 

# -k - key, padded with zeros if length is to small
# -K - raw hex key

# -K key  The actual key to use: this must be represented as a string comprised only of hex digits.  If only the key is specified, the IV must also
#              be specified using the -iv option.  When both a key and a password are specified, the key given with the -K option will be used and the IV
#              generated from the password will be taken.  It probably does not make much sense to specify both key and password.

# -nopad  Disable standard block padding.

    #  -iv IV  The actual IV (initialisation vector) to use: this must be represented as a string comprised only of hex digits.  When only the key is
    #          specified using the -K option, the IV must explicitly be defined.  When a password is being specified using one of the other options, the
    #          IV is generated from this password.


### STRING TO HEX - https://stackoverflow.com/a/12847395/1168586
echo -n "hello" | xxd -p
echo -n "hello" | hexdump -e '"%x"'
# 68656c6c6f
# 6c6c65686f
# console.log(Buffer.from('hello').toString('hex'))
# 68656c6c6f
# docker run -it --rm --platform=linux/amd64 --entrypoint=sh alpine/openssl


echo -n 'daRb/hqM4c3hvwOwmlCUXF7wBJUtt/XbOfz5DSNbciQ=' | openssl enc -base64 -d -aes-256-cbc -K "73686f756c645f62655f65786163746c795f33325f63686172735f3030303030" -iv "3916eedebbcbfd6b9e912290c6034016" -nosalt

# sample demonstrates that without "-nosalt" flag, openssl adds "Salted__" to result
printf 1234567890123456 | openssl enc -aes-256-cbc -iv 0123456789012345 -k 01234567890123456789012345678901 -nosalt | base64
echo -n "nSvtkiJWSWkOmfwJGC4Ndc3BGY4YQ/FFAHU0Bzuk2KU=" | openssl enc -d -base64 -aes-256-cbc -iv 0123456789012345 -k 01234567890123456789012345678901 -nosalt
echo $pass | openssl enc -aes-256-cbc -d -a -K $key -iv $iv


key=$(echo -n "should_be_exactly_32_chars_00000"| xxd -p -c32)
iv=$(echo -n "wXNnWXgCXCZjOZCSeU/rZg==" | base64 -d | xxd -p -c16)
echo -n "Hello world, mac was here" | openssl enc -e -base64 -aes-256-cbc -K "73686f756c645f62655f65786163746c795f33325f63686172735f3030303030" -iv "1cb7b34cd02105f3302502044cb1a8f6"
# 6lqGXWXlPHtrGQHD1eRIajROAPo+3+VZVs7YoAcNeGA=
# wYS703ldD8PFhs7crp4OLabr+pTtn+eMFZdCGp1PWU4=
echo -n "6lqGXWXlPHtrGQHD1eRIajROAPo+3+VZVs7YoAcNeGA=" | openssl enc -d -base64 -aes-256-cbc -K "73686f756c645f62655f65786163746c795f33325f63686172735f3030303030" -iv "1cb7b34cd02105f3302502044cb1a8f6"


# secret (hex): 73686f756c645f62655f65786163746c795f33325f63686172735f3030303030
# iv (hex): 6360d6f35b4a97b78fda52ddb8ea0852
# encrypted (base64): 6Bfpa5LOZrHE7ZgaGF/rrpw6Me2BJKQ0+Y2rZAWJIgE=

text='Hello world, mac was here'
iv=6360d6f35b4a97b78fda52ddb8ea0852
key=73686f756c645f62655f65786163746c795f33325f63686172735f3030303030
encrypted=6Bfpa5LOZrHE7ZgaGF/rrpw6Me2BJKQ0+Y2rZAWJIgE=

# echo -n $text | openssl enc -e -base64 -aes-256-cbc -K "$key" -iv "$iv"  | hexdump -C


# works
echo -n $text | openssl enc -e -base64 -aes-256-cbc -K "$key" -iv "$iv" | openssl enc -d -base64 -aes-256-cbc -K "$key" -iv "$iv"

echo -n $text | openssl enc -e -base64 -aes-256-cbc -K "$key" -iv "$iv"

# works without "-n"
echo '6Bfpa5LOZrHE7ZgaGF/rrpw6Me2BJKQ0+Y2rZAWJIgE=' | openssl enc -d -base64 -aes-256-cbc -K "$key" -iv "$iv"


# // key: 3LwYe5oiscdkqLPWvq5w9WOV0HY3sNffw2NPWTNcF1E=
# // iv: /Y2JOYtPw9nLrYmLNGPxCg==
# // enc: IdD4zFexVoWl65+IBUxjQy0LsXv+FHcNixWEaafBPf0=

key=$(echo -n '3LwYe5oiscdkqLPWvq5w9WOV0HY3sNffw2NPWTNcF1E=' | base64 -d | xxd -p -c32)
iv=$(echo -n '/Y2JOYtPw9nLrYmLNGPxCg==' | base64 -d | xxd -p -c32)
echo 'IdD4zFexVoWl65+IBUxjQy0LsXv+FHcNixWEaafBPf0=' | openssl enc -d -base64 -aes-256-cbc -K "$key" -iv "$iv"
