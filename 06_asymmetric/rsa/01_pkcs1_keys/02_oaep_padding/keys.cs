using System.Security.Cryptography;
using System.Text;

var rsa = RSA.Create(2048);

File.WriteAllText("private.pem", rsa.ExportRSAPrivateKeyPem());
File.WriteAllText("public.pem", rsa.ExportSubjectPublicKeyInfoPem()); // there is ExportRSAPublicKeyPem method, BUT it does export key that wont work anywhere

// var text = "Hello world, mac was here";

// var encrypted = rsa.Encrypt(Encoding.UTF8.GetBytes(text), RSAEncryptionPadding.Pkcs1); // Pkcs1, OaepSHA1, OaepSHA256, OaepSHA384, OaepSHA512
// Console.WriteLine(Convert.ToBase64String(encrypted));

// var decrypted = rsa.Decrypt(encrypted, RSAEncryptionPadding.Pkcs1);
// Console.WriteLine(Encoding.UTF8.GetString(decrypted));
