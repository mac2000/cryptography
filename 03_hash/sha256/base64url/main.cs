var text = "Hello world, mac was here";

var hash = Convert.ToBase64String(System.Security.Cryptography.SHA256.Create().ComputeHash(System.Text.Encoding.UTF8.GetBytes(text))).TrimEnd('=').Replace('+', '-').Replace('/', '_');

Console.WriteLine(hash);
