package cn.cloudleo.biz.service.impl;

import cn.cloudleo.biz.entity.*;
import cn.cloudleo.biz.mapper.ArticleMapper;
import cn.cloudleo.biz.service.*;
import cn.cloudleo.common.utils.QueryPage;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, SysArticle> implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TagService tagService;

    @Autowired
    private ArticleCategoryService articleCategoryService;

    @Autowired
    private ArticleTagService articleTagService;

    @Override
    public List<SysArticle> findByCategory(Long id) {
        return articleMapper.findByCategory(id);
    }

    @Override
    public List<SysArticle> findByTag(Long id) {
        return articleMapper.findByTag(id);
    }

    @Override
    public IPage<SysArticle> list(SysArticle sysArticle, QueryPage queryPage) {
        IPage<SysArticle> page = new Page<>(queryPage.getPage(), queryPage.getLimit());
        LambdaQueryWrapper<SysArticle> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByDesc(SysArticle::getId);
        queryWrapper.like(StringUtils.isNotBlank(sysArticle.getTitle()), SysArticle::getTitle, sysArticle.getTitle());
        queryWrapper.like(StringUtils.isNotBlank(sysArticle.getAuthor()), SysArticle::getAuthor, sysArticle.getAuthor());
        IPage<SysArticle> selectPage = articleMapper.selectPage(page, queryWrapper);
        findInit(selectPage.getRecords());
        return selectPage;
    }

    /**
     * ?????????????????????????????????
     */
    private void findInit(List<SysArticle> list) {
        if (!list.isEmpty()) {
            list.forEach(article -> {
                List<SysCategory> sysCategoryList = categoryService.findByArticleId(article.getId());
                if (sysCategoryList.size() > 0) {
                    article.setCategory(sysCategoryList.get(0));
                }
                List<SysTag> tagList = tagService.findByArticleId(article.getId());
                article.setTags(tagList);
            });
        }
    }

    @Override
    public SysArticle findById(Long id) {
        SysArticle sysArticle = articleMapper.selectById(id);
        if (sysArticle != null) {
            List<SysArticle> sysArticleList = new ArrayList<>();
            sysArticleList.add(sysArticle);
            findInit(sysArticleList);
            return sysArticle;
        }
        return null;
    }

    @Override
    @Transactional
    public void add(SysArticle sysArticle) {
        sysArticle.setCreateTime(new Date());
        // ??????????????????
        articleMapper.insert(sysArticle);
        // ???????????????-???????????????-?????? ????????????
        this.updateArticleCategoryTags(sysArticle);
    }

    /**
     * ????????????-??????-???????????????????????????
     *
     * @param sysArticle ?????????Article???Tags???Category?????????
     */
    private void updateArticleCategoryTags(SysArticle sysArticle) {
        if (sysArticle.getId() != 0) {
            if (sysArticle.getCategory() != null) {
                articleCategoryService.deleteByArticleId(sysArticle.getId());
                SysCategory sysCategory = categoryService.getById(sysArticle.getCategory());
                if (sysCategory != null) {
                    articleCategoryService.add(new SysArticleCategory(sysArticle.getId(), sysCategory.getId()));
                }
            }
            if (sysArticle.getTags() != null && sysArticle.getTags().size() > 0) {
                articleTagService.deleteByArticleId(sysArticle.getId());
                sysArticle.getTags().forEach(tag -> {
                    articleTagService.add(new SysArticleTag(sysArticle.getId(), tag.getId()));
                });
            }
        }
    }

    @Override
    @Transactional
    public void update(SysArticle sysArticle) {
        // ????????????????????????
        articleMapper.updateById(sysArticle);
        // ?????? ??????-???????????????-?????? ????????????
        updateArticleCategoryTags(sysArticle);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        if (id != null && id != 0) {
            articleMapper.deleteById(id);
            //????????????-??????????????????
            articleCategoryService.deleteByArticleId(id);
            //????????????-??????????????????
            articleTagService.deleteByArticleId(id);
        }
    }
}
