package cn.cloudleo.biz.mapper;

import cn.cloudleo.biz.entity.SysTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface TagMapper extends BaseMapper<SysTag> {

    List<SysTag> findByArticleId(long id);
}
