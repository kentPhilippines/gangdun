package com.ruoyi.web.controller.user;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/merchantActing")
public class MerchantActing extends BaseController{
    private String prefix = "user";
    @RequiresPermissions("user:merchantActing:view")
    @GetMapping()
    public String merchantActing() {
        return prefix + "/merchantActing";
    }
}
