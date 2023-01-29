import java.math.BigInteger;
import java.nio.charset.StandardCharsets;

class Main {
    public static void main(String[] args) {
        String text = "Hello world, mac was here";
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        String hex = new BigInteger(1, bytes).toString(16);
        System.out.println(hex);
    }
}
