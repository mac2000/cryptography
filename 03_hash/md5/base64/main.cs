var text = "Hello world, mac was here";

var hash = Convert.ToBase64String(System.Security.Cryptography.MD5.Create().ComputeHash(System.Text.Encoding.UTF8.GetBytes(text)));

Console.WriteLine(hash);
