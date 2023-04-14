package com.ruoyi.web.controller.order;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order/wit")
public class Wit extends BaseController {
    private String prefix = "order";
    @RequiresPermissions("order:wit:view")
    @GetMapping()
    public String wit() {
        return prefix + "/wit";
    }
}
