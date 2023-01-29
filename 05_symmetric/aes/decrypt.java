import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

class Main {
    public static void main(String[] args) throws InvalidAlgorithmParameterException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, NoSuchPaddingException, NoSuchAlgorithmException {
        String encryptedBase64 = "zduKiEPpq40lxlzX8bWSEqGSVHL0CZKA/xs0zODqpxM=";
        String key = "must_be_exactly_32_chars_long_00";
        String iv = "16_random_chars_";

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES"), new IvParameterSpec(iv.getBytes(StandardCharsets.UTF_8)));
        String text = new String(cipher.doFinal(Base64.getDecoder().decode(encryptedBase64)));

        System.out.println(text);
    }
}
