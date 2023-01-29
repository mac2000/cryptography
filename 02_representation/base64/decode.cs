var b64 = "SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ==";
var bytes = Convert.FromBase64String(b64);
var text = System.Text.Encoding.UTF8.GetString(bytes);
Console.WriteLine(text);
