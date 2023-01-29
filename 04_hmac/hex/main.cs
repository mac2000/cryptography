var text = "Hello world, mac was here";
var secret = "Secret used to sign hash";

var hash = BitConverter.ToString(new System.Security.Cryptography.HMACSHA256(System.Text.Encoding.UTF8.GetBytes(secret)).ComputeHash(System.Text.Encoding.UTF8.GetBytes(text))).Replace("-", string.Empty).ToLower();

Console.WriteLine(hash);
