package cn.cloudleo.common.aspect;

import cn.cloudleo.common.exception.GlobalException;
import cn.cloudleo.common.utils.HttpContextUtil;
import cn.cloudleo.common.utils.IPUtil;
import cn.cloudleo.biz.entity.SysLog;
import cn.cloudleo.biz.entity.SysUser;
import cn.cloudleo.biz.service.LogService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.apache.shiro.SecurityUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * Log 切面
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@Aspect
@Component
public class LogAspect {

    @Autowired
    private LogService logService;

    @Pointcut("@annotation(cn.cloudleo.common.annotation.Log)")
    public void pointcut() {
    }

    @Around("pointcut()")
    public Object around(ProceedingJoinPoint proceedingJoinPoint) throws JsonProcessingException {
        Object result = null;
        try {
            result = proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            throw new GlobalException(throwable.getMessage());
        }
        SysUser sysUser = (SysUser) SecurityUtils.getSubject().getPrincipal();
        if (sysUser != null) {
            long beginTime = System.currentTimeMillis();
            //获取Request请求
            HttpServletRequest request = HttpContextUtil.getHttpServletRequest();
            //设置IP地址
            String ip = IPUtil.getIpAddr(request);
            //记录时间（毫秒）
            long time = System.currentTimeMillis() - beginTime;
            //保存日志
            SysLog log = new SysLog();
            log.setIp(ip);
            log.setTime(time);
            log.setUsername(sysUser.getUsername());
            logService.saveLog(proceedingJoinPoint, log);
        }
        return result;
    }
}
