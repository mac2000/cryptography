var text = "Hello world, mac was here";
var bytes = System.Text.Encoding.UTF8.GetBytes(text);
var b64 = Convert.ToBase64String(bytes);

Console.WriteLine(b64);
