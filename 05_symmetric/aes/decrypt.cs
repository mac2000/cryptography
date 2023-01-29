var encrypted = "zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM=";
var key = "must_be_exactly_32_chars_long_00";
var iv = "16_random_chars_";

var aes = System.Security.Cryptography.Aes.Create();
aes.Mode = System.Security.Cryptography.CipherMode.CBC;
aes.KeySize = 256;
aes.Key = System.Text.Encoding.UTF8.GetBytes(key);
aes.IV = System.Text.Encoding.UTF8.GetBytes(iv);

using var ms = new MemoryStream(Convert.FromBase64String(encrypted));
using var cs = new System.Security.Cryptography.CryptoStream(ms, aes.CreateDecryptor(), System.Security.Cryptography.CryptoStreamMode.Read);
using var sr = new StreamReader(cs);

var decrypted = sr.ReadToEnd();
        
Console.WriteLine(decrypted);
