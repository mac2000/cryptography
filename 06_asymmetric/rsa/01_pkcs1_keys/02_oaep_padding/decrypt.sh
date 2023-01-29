decrypted=$(cat protected.txt | base64 -d | openssl rsautl -decrypt -inkey private.pem -oaep)
echo $decrypted

# -oaep              Use PKCS#1 OAEP padding
# -pkcs              Use PKCS#1 v1.5 padding (default)
# -raw               Use no padding
# -x931              Use ANSI X9.31 padding


# decrypted=$(cat protected.txt | base64 -d | openssl pkeyutl -decrypt -inkey private.pem -pkeyopt rsa_padding_mode:pkcs1 -pkeyopt rsa_oaep_md:sha256 -pkeyopt rsa_mgf1_md:sha256)
# echo $decrypted

# -pkeyopt rsa_padding_mode:oaep
# -pkeyopt rsa_oaep_md:sha256
# -pkeyopt rsa_mgf1_md:sha256

# rsa_padding_mode:mode
#     This sets the RSA padding mode.  Acceptable values for mode are pkcs1 for PKCS#1 padding; none for no padding; oaep for OAEP mode;
#     x931 for X9.31 mode; and pss for PSS.

