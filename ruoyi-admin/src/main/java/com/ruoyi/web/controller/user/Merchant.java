package com.ruoyi.web.controller.user;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/merchant")
public class Merchant extends BaseController{
    private String prefix = "user";
    @RequiresPermissions("user:merchant:view")
    @GetMapping()
    public String merchant() {
        return prefix + "/merchant";
    }
}
