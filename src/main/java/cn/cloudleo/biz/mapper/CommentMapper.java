package cn.cloudleo.biz.mapper;

import cn.cloudleo.biz.entity.SysComment;
import cn.cloudleo.common.utils.SplineChart;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface CommentMapper extends BaseMapper<SysComment> {

    @Select("select date_format(create_time, '%Y-%m-%d') time, count(*) num from tb_comment group by date_format(create_time, '%Y-%m-%d')")
    List<SplineChart> chart();
}
