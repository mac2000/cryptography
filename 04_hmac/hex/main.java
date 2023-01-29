import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

class Main {
    public static void main(String[] args) throws NoSuchAlgorithmException, InvalidKeyException {
        String text = "Hello world, mac was here";
        String secret = "Secret used to sign hash";

        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), "HmacSHA256"));
        String hash = new BigInteger(1, mac.doFinal(text.getBytes(StandardCharsets.UTF_8))).toString(16);

        System.out.println(hash);
    }
}
