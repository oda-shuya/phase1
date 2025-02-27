package user;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
    // パスワードをハッシュ化するメソッド
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt(12));
    }

    // パスワードが一致するか検証するメソッド
    public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.checkpw(plainTextPassword, hashedPassword);
    }
}
