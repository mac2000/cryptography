var text = "Hello world, mac was here";

var hash = BitConverter.ToString(System.Security.Cryptography.SHA256.Create().ComputeHash(System.Text.Encoding.UTF8.GetBytes(text))).Replace("-", string.Empty).ToLower();

Console.WriteLine(hash);