var text = "Hello world, mac was here";
var key = "must_be_exactly_32_chars_long_00";
var iv = "16_random_chars_";

var aes = System.Security.Cryptography.Aes.Create();
aes.Mode = System.Security.Cryptography.CipherMode.CBC;
aes.KeySize = 256;
aes.Key = System.Text.Encoding.UTF8.GetBytes(key);
aes.IV = System.Text.Encoding.UTF8.GetBytes(iv);

byte[] enc;
using (var ms = new MemoryStream())
{
    using (var cs = new System.Security.Cryptography.CryptoStream(ms, aes.CreateEncryptor(), System.Security.Cryptography.CryptoStreamMode.Write))
    {
        using (var sw = new StreamWriter(cs))
        {
            sw.Write(text);
        }
    }

    enc = ms.ToArray();
}

Console.WriteLine(Convert.ToBase64String(enc));
