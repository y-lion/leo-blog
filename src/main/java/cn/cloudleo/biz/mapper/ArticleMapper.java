package cn.cloudleo.biz.mapper;

import cn.cloudleo.biz.entity.SysArticle;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface ArticleMapper extends BaseMapper<SysArticle> {

    List<SysArticle> findByCategory(Long id);

    List<SysArticle> findByTag(Long id);
}
