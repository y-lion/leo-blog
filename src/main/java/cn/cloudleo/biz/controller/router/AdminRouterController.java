package cn.cloudleo.biz.controller.router;

import cn.cloudleo.biz.entity.SysUser;
import cn.cloudleo.biz.service.ArticleService;
import cn.cloudleo.biz.service.CommentService;
import cn.cloudleo.biz.service.TagService;
import cn.cloudleo.biz.service.UserService;
import cn.cloudleo.common.controller.BaseController;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

/**
 * 博客后台页面路由
 *
 * @author cloudleo
 * @date 2020/6/27
 */
@ApiIgnore
@Controller
public class AdminRouterController extends BaseController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private TagService tagService;

    @Autowired
    private UserService userService;

    /**
     * 注销接口
     *
     * @return
     */
    @GetMapping(value = "/logout")
    public String logout() {
        Subject subject = getSubject();
        subject.logout();
        return "redirect:/login";
    }

    /**
     * 登录状态校验
     */
    private boolean auth(HttpServletRequest request, Model model) {
        Object o = request.getSession().getAttribute("user");
        model.addAttribute("user", o);
        return o instanceof SysUser;
    }

    @GetMapping("/login")
    public String login(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "login";
    }


    @GetMapping("/cloudleo")
    public String index(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        model.addAttribute("articleCount", articleService.count());
        model.addAttribute("tagCount", tagService.count());
        model.addAttribute("commentCount", commentService.count());
        model.addAttribute("userCount", userService.count());
        return "cloudleo/index/index";
    }

    @GetMapping("/cloudleo/profile")
    public String profile(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/profile/index";
    }

    @GetMapping("/cloudleo/article/write")
    public String articleWrite(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/article/write/index";
    }

    @GetMapping("/cloudleo/article/list")
    public String articleList(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/article/list/index";
    }

    @GetMapping("/cloudleo/blog/tag")
    public String blogTag(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/blog/tag/index";
    }

    @GetMapping("/cloudleo/blog/category")
    public String blogCategory(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/blog/category/index";
    }

    @GetMapping("/cloudleo/blog/link")
    public String blogLink(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/blog/link/index";
    }

    @GetMapping("/cloudleo/blog/comment")
    public String blogComment(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/blog/comment/index";
    }

    @GetMapping("/cloudleo/setting/log")
    public String settingLog(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/setting/log/index";
    }

    @GetMapping("/cloudleo/setting/qiniu")
    public String settingQiniu(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/setting/qiniu/index";
    }

    @GetMapping("/cloudleo/setting/swagger")
    public String settingSwagger(HttpServletRequest request, Model model) {
        if (!this.auth(request, model)) {
            return "redirect:/login";
        }
        return "cloudleo/setting/swagger/index";
    }
}
