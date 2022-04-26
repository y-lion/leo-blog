package cn.cloudleo.biz.controller;

import cn.cloudleo.biz.entity.SysArticle;
import cn.cloudleo.biz.service.ArticleService;
import cn.cloudleo.common.annotation.Log;
import cn.cloudleo.common.controller.BaseController;
import cn.cloudleo.common.exception.GlobalException;
import cn.cloudleo.common.utils.QueryPage;
import cn.cloudleo.common.utils.R;
import cn.hutool.core.io.FileUtil;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * 文章功能接口
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@RestController
@RequestMapping("/article")
@Api(value = "ArticleController", tags = {"文章功能接口"})
public class ArticleController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/findByCategory/{id}")
    public R findByCategory(@PathVariable Long id) {
        return new R<>(articleService.findByCategory(id));
    }

    @GetMapping("/findByTag/{id}")
    public R findByTag(@PathVariable Long id) {
        return new R<>(articleService.findByTag(id));
    }

    @PostMapping("/list")
    public R list(@RequestBody SysArticle sysArticle, QueryPage queryPage) {
        return new R<>(super.getData(articleService.list(sysArticle, queryPage)));
    }

    @GetMapping("{id}")
    public R findById(@PathVariable Long id) {
        return new R<>(articleService.findById(id));
    }

    @PostMapping
    @Log("新增文章")
    public R add(@RequestBody SysArticle sysArticle) {
        try {
            sysArticle.setAuthor(this.getCurrentUser().getUsername());
            articleService.add(sysArticle);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }

    @PutMapping
    @Log("更新文章")
    public R update(@RequestBody SysArticle sysArticle) {
        try {
            articleService.update(sysArticle);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }

    @DeleteMapping("/{id}")
    @Log("删除文章")
    public R delete(@PathVariable Long id) {
        try {
            articleService.delete(id);
            return new R();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(e.getMessage());
        }
    }
}
