encrypted='zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM='
key='must_be_exactly_32_chars_long_00'
iv='16_random_chars_'
keyhex=$(echo -n $key | xxd -p -c32)
ivhex=$(echo -n $iv | xxd -p -c32)
decrypted=$(echo $encrypted | openssl enc -d -base64 -aes-256-cbc -K $keyhex -iv $ivhex)
echo $decrypted
