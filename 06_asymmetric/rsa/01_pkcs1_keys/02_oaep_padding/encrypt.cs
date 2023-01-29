using System.Security.Cryptography;
using System.Text;

var rsa = RSA.Create();
rsa.ImportFromPem(File.ReadAllText("public.pem"));

var text = "Hello world, mac was here";

var encrypted = rsa.Encrypt(Encoding.UTF8.GetBytes(text), RSAEncryptionPadding.OaepSHA1);

Console.WriteLine(Convert.ToBase64String(encrypted));

File.WriteAllText("protected.txt", Convert.ToBase64String(encrypted));

// RSAEncryptionPadding.Pkcs1      - PKCS #1 encryption standard
// RSAEncryptionPadding.OaepSHA1   - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA1 hash algorithm
// RSAEncryptionPadding.OaepSHA256 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA256 hash algorithm
// RSAEncryptionPadding.OaepSHA384 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA-384 hash algorithm
// RSAEncryptionPadding.OaepSHA512 - Optimal Asymmetric Encryption Padding (OAEP) encryption standard with a SHA512 hash algorithm
