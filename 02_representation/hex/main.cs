var text = "Hello world, mac was here";
var bytes = System.Text.Encoding.UTF8.GetBytes(text);
var hex = BitConverter.ToString(bytes).Replace("-", string.Empty).ToLower();

Console.WriteLine(hex);