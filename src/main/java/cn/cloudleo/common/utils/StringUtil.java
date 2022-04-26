package cn.cloudleo.common.utils;


import java.util.UUID;

public class StringUtil {

    public static String getRandomName(String fileName) {
        int index = fileName.lastIndexOf(".");
        if ((fileName == null || fileName.isEmpty()) || index == -1){
            throw new IllegalArgumentException();
        }
        String suffix = fileName.substring(index);
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        String path = uuid + suffix;
        return path;
    }
}
