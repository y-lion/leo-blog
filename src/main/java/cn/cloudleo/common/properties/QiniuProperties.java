package cn.cloudleo.common.properties;

import lombok.Data;

/**
 * 七牛云配置参数
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@Data
public class QiniuProperties {

    /**
     * AccessKey
     */
    private String ak;

    /**
     * SecretKey
     */
    private String sk;

    /**
     * BucketName
     */
    private String bn;

    /**
     * 外链
     */
    private String url;
}
