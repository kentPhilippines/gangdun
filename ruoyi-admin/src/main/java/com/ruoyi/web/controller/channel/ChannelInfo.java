package com.ruoyi.web.controller.channel;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("channel/info")
public class ChannelInfo extends BaseController {
    private String prefix = "channel";
    @RequiresPermissions("channel:info:view")
    @GetMapping()
    public String info() {
        return prefix + "/info";
    }
}
