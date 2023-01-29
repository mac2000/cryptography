import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

class Main {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        String text = "Hello world, mac was here";
        String hash = Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8)));
        System.out.println(hash);
    }
}
