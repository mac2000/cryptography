using System.Security.Cryptography;
using System.Text;

var rsa = RSA.Create();
// rsa.ImportRSAPrivateKey(File.ReadAllBytes("private.pem"), out var _);
rsa.ImportFromPem(File.ReadAllText("private.pem"));

var encrypted = Convert.FromBase64String(File.ReadAllText("protected.txt"));
var decrypted = rsa.Decrypt(encrypted, RSAEncryptionPadding.Pkcs1);

Console.WriteLine(Encoding.UTF8.GetString(decrypted));

// RSAEncryptionPadding.Pkcs1      - PKCS #1 encryption standard
// RSAEncryptionPadding.OaepSHA1   - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA1 hash algorithm
// RSAEncryptionPadding.OaepSHA256 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA256 hash algorithm
// RSAEncryptionPadding.OaepSHA384 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA-384 hash algorithm
// RSAEncryptionPadding.OaepSHA512 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA512 hash algorithm
