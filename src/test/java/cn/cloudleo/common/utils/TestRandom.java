package cn.cloudleo.common.utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class TestRandom {
    public static void main(String[] args) {
//        List<String> a = getRandomList3();
//        for(int i = 0;i<a.size();i++){
//            System.out.println("cloud"+a.get(i));
//        }
        String start = "cloud";
        for(int i = 0;i<201;i++){
            String s = i+"";
            if(i<10){
                System.out.println(start+"0"+i);
            }
            System.out.println(start+s);
        }
    }
    public static List<String> getRandomList3(){
        List<String> list = new ArrayList<>();
        String s = "qwertyuiopasdfghjklzxcvbnm";
        for(int a = 0;a<s.length();a++){
            for(int b=0;b<s.length();b++){
                list.add(s.charAt(a)+""+s.charAt(b));
            }
        }
        Collections.shuffle(list);
        return list;
    }

//                    for(int c=0;c<s.length();c++){
//        list.add(s.charAt(a)+""+s.charAt(b)+""+s.charAt(c));
//    }
}
