package com.ruoyi.web.controller.channel;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("channel/payType")
public class PayType extends BaseController {
    private String prefix = "channel";
    @RequiresPermissions("channel:payType:view")
    @GetMapping()
    public String payType() {
        return prefix + "/payType";
    }
}
