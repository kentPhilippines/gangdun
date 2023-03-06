package com.ruoyi.web.controller.date;

import com.ruoyi.common.core.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/date")
public class DateCenter extends BaseController {
    private String prefix = "date";

    @RequiresPermissions("date:dateCenter:view")
    @GetMapping()
    public String dept() {
        return prefix + "/dateCenter";
    }


}
