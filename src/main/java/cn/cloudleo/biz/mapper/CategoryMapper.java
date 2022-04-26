package cn.cloudleo.biz.mapper;

import cn.cloudleo.biz.entity.SysCategory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface CategoryMapper extends BaseMapper<SysCategory> {

    List<SysCategory> findCategoryByArticleId(long id);
}
