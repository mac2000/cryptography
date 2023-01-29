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
        String text = "Hello world, mac was here";
        String key = "must_be_exactly_32_chars_long_00";
        String iv = "16_random_chars_";

        SecretKeySpec secretKey=new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");
        IvParameterSpec ivParameterSpec=new IvParameterSpec(iv.getBytes(StandardCharsets.UTF_8));
        Cipher cipher=Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE,secretKey,ivParameterSpec);
        byte[] bytes = cipher.doFinal(text.getBytes(StandardCharsets.UTF_8));

        String b64 = Base64.getEncoder().encodeToString(bytes);
        System.out.println(b64);
    }
}
