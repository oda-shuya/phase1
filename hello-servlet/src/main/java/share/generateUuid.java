package share;

import java.util.UUID;

public class generateUuid {
    public static String generate(){
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }
}