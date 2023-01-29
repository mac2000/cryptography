import java.nio.charset.StandardCharsets;
import java.util.Base64;

class Main {
    public static void main(String[] args) {
        String text = "Hello world, mac was here";
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        String b64 = Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
        System.out.println(b64);
    }
}
