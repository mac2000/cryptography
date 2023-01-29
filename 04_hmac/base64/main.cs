var text = "Hello world, mac was here";
var secret = "Secret used to sign hash";

var hash = Convert.ToBase64String(new System.Security.Cryptography.HMACSHA256(System.Text.Encoding.UTF8.GetBytes(secret)).ComputeHash(System.Text.Encoding.UTF8.GetBytes(text)));

Console.WriteLine(hash);
