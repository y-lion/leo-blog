package cn.cloudleo.biz.service;


import cn.cloudleo.common.utils.QueryPage;
import cn.cloudleo.biz.entity.SysLoginLog;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface LoginLogService extends IService<SysLoginLog> {

    IPage<SysLoginLog> list(SysLoginLog log, QueryPage queryPage);

    void delete(Long id);

    int deleteAll();

    void saveLog(SysLoginLog log);
}
