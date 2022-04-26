package cn.cloudleo.common.properties;

import lombok.Data;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

/**
 * 系统配置类定义
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@Data
@SpringBootConfiguration
@PropertySource(value = {"classpath:leo.properties"})
@ConfigurationProperties(prefix = "leo")
public class LeoProperties {

    private QiniuProperties qiniu = new QiniuProperties();

    private ShiroProperties shiro = new ShiroProperties();

    private SwaggerProperties swagger = new SwaggerProperties();
}
