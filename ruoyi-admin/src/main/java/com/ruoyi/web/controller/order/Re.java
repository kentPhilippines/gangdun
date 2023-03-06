package com.ruoyi.web.controller.order;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order/re")
public class Re extends BaseController {
    private String prefix = "order";
    @RequiresPermissions("order:re:view")
    @GetMapping()
    public String re() {
        return prefix + "/re";
    }
}
