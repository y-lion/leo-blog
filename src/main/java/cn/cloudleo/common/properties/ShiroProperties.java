package cn.cloudleo.common.properties;

import lombok.Data;

/**
 * Shiro配置参数
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@Data
public class ShiroProperties {

    private long sessionTimeout;
    private int cookieTimeout;
    private String anonUrl;
    private String loginUrl;
    private String successUrl;
    private String logoutUrl;
    private String cipherKey;
}
