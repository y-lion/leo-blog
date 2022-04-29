package cn.cloudleo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("cn.cloudleo.biz.mapper")
public class LeoApplication {

    public static void main(String[] args) {
        //测试
        SpringApplication.run(LeoApplication.class, args);
    }
}
