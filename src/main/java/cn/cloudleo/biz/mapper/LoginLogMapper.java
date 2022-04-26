package cn.cloudleo.biz.mapper;


import cn.cloudleo.biz.entity.SysLoginLog;
import cn.cloudleo.common.utils.SplineChart;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface LoginLogMapper extends BaseMapper<SysLoginLog> {
    @Delete("delete from tb_login_log")
    int deleteAll();
}
