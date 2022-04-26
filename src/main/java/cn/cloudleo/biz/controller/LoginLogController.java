package cn.cloudleo.biz.controller;

import cn.cloudleo.common.annotation.Log;
import cn.cloudleo.common.controller.BaseController;
import cn.cloudleo.common.exception.GlobalException;
import cn.cloudleo.common.utils.QueryPage;
import cn.cloudleo.common.utils.R;
import cn.cloudleo.biz.entity.SysLoginLog;
import cn.cloudleo.biz.service.LoginLogService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author cloudleo
 * @date 2020/6/27
 */
@RestController
@RequestMapping("/loginlog")
@Api(value = "LoginLogController", tags = {"登录日志管理接口"})
public class LoginLogController extends BaseController {

    @Autowired
    private LoginLogService loginLogService;

    @PostMapping("/list")
    public R findByPage(@RequestBody SysLoginLog sysLoginLog, QueryPage queryPage) {
        return new R<>(super.getData(loginLogService.list(sysLoginLog, queryPage)));
    }

    @Log("删除所有登录日志")
    @DeleteMapping("/delAll")
    public R delAll() {
        try {
            loginLogService.deleteAll();
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }


    @Log("删除登录日志")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable Long id) {
        try {
            loginLogService.delete(id);
            return new R();
        } catch (Exception e) {
            throw new GlobalException(e.getMessage());
        }
    }
}
