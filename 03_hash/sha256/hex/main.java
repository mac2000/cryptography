import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

class Main {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        String text = "Hello world, mac was here";
        String hash = new BigInteger(1, MessageDigest.getInstance("SHA-256").digest(text.getBytes(StandardCharsets.UTF_8))).toString(16);
        System.out.println(hash);
    }
}
