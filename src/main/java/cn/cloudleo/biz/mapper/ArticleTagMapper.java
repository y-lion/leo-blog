package cn.cloudleo.biz.mapper;

import cn.cloudleo.biz.entity.SysArticleTag;
import cn.cloudleo.biz.entity.SysTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
public interface ArticleTagMapper extends BaseMapper<SysArticleTag> {

    List<SysTag> findByArticleId(long articleId);
}
