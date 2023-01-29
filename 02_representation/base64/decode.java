import java.nio.charset.StandardCharsets;
import java.util.Base64;

class Main {
    public static void main(String[] args) {
        String b64 = "SGVsbG8gd29ybGQsIG1hYyB3YXMgaGVyZQ==";
        String text = new String(Base64.getDecoder().decode(b64));
        System.out.println(text);
    }
}
