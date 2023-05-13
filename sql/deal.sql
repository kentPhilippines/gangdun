-- pay.pay_amount definition

CREATE TABLE `pay_amount`
(
    `id`             int(32) NOT NULL AUTO_INCREMENT COMMENT '' 数据id '',
    `orderId`        char(48)       NOT NULL COMMENT '' 手动订单号 '',
    `userId`         varchar(32)    NOT NULL COMMENT '' 会员id(唯一识别号)(index索引)'',
    `amountType`     char(2)        NOT NULL COMMENT '' 1 加款类型 2 扣款类型 3 转账类型 '',
    `accname`        varchar(32)             DEFAULT NULL COMMENT '' 申请人姓名【后台管理人员】'',
    `orderStatus`    char(3)        NOT NULL COMMENT '' 1申请 2审批中 3成功 4失败 5挂起 '',
    `amount`         decimal(19, 2) NOT NULL COMMENT '' 金额 '',
    `fee`            decimal(19, 2)          DEFAULT NULL COMMENT '' 手续费 '',
    `actualAmount`   decimal(19, 2) NOT NULL COMMENT '' 真实到账金额 '',
    `dealDescribe`   text           NOT NULL COMMENT '' 加扣款描述 '',
    `createTime`     datetime       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '' 数据创建时间 '',
    `submitTime`     datetime                DEFAULT CURRENT_TIMESTAMP COMMENT '' 数据修改时间 '',
    `settlement`     int(2) NOT NULL DEFAULT '' 1 '' COMMENT '' 1为订单成功未结算，2为订单成功已结算 '',
    `approval`       varchar(50)             DEFAULT NULL COMMENT '' 审核人 '',
    `comment`        varchar(300)            DEFAULT NULL COMMENT '' 审核意见 '',
    `transferUserId` varchar(32)             DEFAULT NULL COMMENT '' 转账订单入款用户 '',
    `currency`       varchar(5)     NOT NULL DEFAULT '' CNY '' COMMENT '' 货币类型 '',
    PRIMARY KEY (`id`),
    UNIQUE KEY `orderId` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''手动加扣款记录表'';




-- pay.pay_channel_info definition

CREATE TABLE `pay_channel_info` (
                                    `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                    `channelId` varchar(32) NOT NULL COMMENT '用户id【登录账号】',
                                    `channelName` varchar(32) NOT NULL COMMENT '用户昵称',
                                    `switchs` int(2) NOT NULL DEFAULT '1' COMMENT '当前用户总开关 1开启0关闭',
                                    `receiveOrderState` int(2) NOT NULL DEFAULT '0' COMMENT '是否处于入款接单状态 1 接单 0 暂停接单',
                                    `remitOrderState` int(2) NOT NULL DEFAULT '0' COMMENT '是否处于出款接单状态 1 接单 0 暂停接单',
                                    `password` text COMMENT 'shiro加密秘钥【登录】',
                                    `payPasword` text COMMENT 'shiro加密秘钥【资金】【商户则为交易秘钥】',
                                    `privateKey` text COMMENT '商户私钥',
                                    `publicKey` text COMMENT '商户公钥',
                                    `dealUrl` varchar(128) DEFAULT NULL COMMENT '交易接口',
                                    `witUrl` varchar(256) DEFAULT NULL COMMENT '代付接口',
                                    `fundUrl` varchar(256) DEFAULT NULL COMMENT '资金查询接口',
                                    `findDealOrderUrl` varchar(256) DEFAULT NULL COMMENT '交易订单查询接口',
                                    `findWitOrderUrl` varchar(256) DEFAULT NULL COMMENT '代付订单查询接口',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `user` (`channelId`),
                                    UNIQUE KEY `username` (`channelName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表';






-- pay.pay_channel_rate definition

CREATE TABLE `pay_channel_rate` (
                                    `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                    `channelId` varchar(24) NOT NULL COMMENT '渠道ID',
                                    `productId` varchar(24) NOT NULL COMMENT '产品id',
                                    `impl` varchar(32) NOT NULL COMMENT '实体类对应关系',
                                    `channelRFee` decimal(19,6) DEFAULT NULL COMMENT '渠道充值 费率',
                                    `channelDFee` decimal(19,6) DEFAULT NULL COMMENT '渠道代付费率',
                                    `channelNo` varchar(24) DEFAULT NULL COMMENT '上游渠道通道编号',
                                    `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                    `switchs` int(2) NOT NULL DEFAULT '1' COMMENT '开关 1 开启 0 关闭',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `impl` (`channelId`,`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






-- pay.pay_deal_order definition

CREATE TABLE `pay_deal_order` (
                                  `id` mediumint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                  `orderId` char(48) NOT NULL COMMENT '订单号',
                                  `associatedId` char(48) NOT NULL COMMENT '关联订单号',
                                  `orderStatus` char(2) NOT NULL COMMENT '订单状态:0预下单1处理中2成功3未收到回调4失败5超时6订单申述7人工处理',
                                  `dealAmount` decimal(19,4) NOT NULL COMMENT '订单交易金额',
                                  `dealFee` decimal(19,4) DEFAULT NULL COMMENT '订单交易手续费',
                                  `actualAmount` decimal(17,4) NOT NULL COMMENT '实际到账金额',
                                  `orderType` char(2) DEFAULT NULL COMMENT '订单类型:1四方交易,2三方交易,3撮合交易',
                                  `orderAccount` char(24) NOT NULL COMMENT '订单关联商户账号',
                                  `orderQrUser` char(32) NOT NULL COMMENT '关联码商账户',
                                  `orderQr` varchar(200) DEFAULT NULL,
                                  `externalOrderId` varchar(48) DEFAULT NULL COMMENT '外部订单号(下游商户请求参数,用户数据回调)',
                                  `dealDescribe` text COMMENT '交易备注',
                                  `notify` varchar(128) DEFAULT NULL COMMENT '订单异步回调地址',
                                  `back` varchar(128) DEFAULT NULL COMMENT '订单同步回调地址',
                                  `isNotify` varchar(3) NOT NULL DEFAULT 'NO' COMMENT '是否發送通知 //  YES 已發送    NO 未發送',
                                  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据生成时间（该时间等同于交易时间）',
                                  `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据修改时间',
                                  `product` varchar(28) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单交易产品类型',
                                  `profit` decimal(19,6) DEFAULT NULL COMMENT '当前订单系统盈利',
                                  `settlement` int(2) NOT NULL DEFAULT '1' COMMENT '1为订单成功未结算，2为订单成功已结算',
                                  `currency` varchar(5) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
                                  `payInfo` varchar(100) DEFAULT NULL COMMENT '回调详情',
                                  `operater` varchar(16) DEFAULT NULL COMMENT '操作人',
                                  `recordType` varchar(16) DEFAULT NULL COMMENT '记录类型',
                                  `systemAmount` decimal(19,4) DEFAULT '0.0000' COMMENT '系统业务余额',
                                  `urge` int(10) unsigned DEFAULT '0' COMMENT '催单，1是催单，0是正常',
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `orderId` (`orderId`),
                                  KEY `idx_associatedId` (`associatedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主交易订单表';








-- pay.pay_deal_order_app definition

CREATE TABLE `pay_deal_order_app` (
                                      `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                      `orderId` varchar(64) NOT NULL COMMENT '订单号',
                                      `orderAccount` varchar(32) DEFAULT NULL COMMENT '订单关联商户账号',
                                      `orderStatus` char(2) NOT NULL COMMENT '订单状态:',
                                      `orderAmount` decimal(19,2) NOT NULL COMMENT '订单金额(原始金额)',
                                      `orderIp` varchar(24) NOT NULL COMMENT '订单生成IP(源头ip)',
                                      `appOrderId` varchar(128) DEFAULT NULL COMMENT '交易外部订单号',
                                      `notify` varchar(128) DEFAULT NULL COMMENT '订单异步回调地址',
                                      `back` varchar(128) DEFAULT NULL COMMENT '订单同步回调地址',
                                      `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据修改时间',
                                      `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据生成时间（该时间等同于交易时间）',
                                      `product` char(24) DEFAULT NULL COMMENT '支付产品类型',
                                      `fee` decimal(19,4) DEFAULT NULL COMMENT '当前订单结算费率手续费',
                                      `currency` varchar(5) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
                                      `actualAmount` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT '实际支付金额',
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `orderId` (`orderId`),
                                      UNIQUE KEY `appOrderId_2` (`appOrderId`,`orderAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登记表';










-- pay.pay_deal_wit definition

CREATE TABLE `pay_deal_wit` (
                                `id` mediumint(16) unsigned NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                `orderId` char(48) NOT NULL COMMENT '订单号',
                                `associatedId` char(48) NOT NULL COMMENT '关联订单号',
                                `orderStatus` char(2) NOT NULL COMMENT '订单状态:0预下单1处理中2成功3未收到回调4失败5超时6订单申述7人工处理',
                                `dealAmount` decimal(19,4) NOT NULL COMMENT '订单交易金额',
                                `dealFee` decimal(19,4) DEFAULT NULL COMMENT '订单交易手续费',
                                `actualAmount` decimal(17,4) NOT NULL COMMENT '实际到账金额',
                                `orderType` char(2) DEFAULT NULL COMMENT '订单类型:1四方交易,2三方交易',
                                `orderAccount` char(24) NOT NULL COMMENT '订单关联商户账号',
                                `orderQrUser` char(32) NOT NULL COMMENT '关联码商账户或者渠道账户',
                                `orderQr` varchar(200) DEFAULT NULL,
                                `externalOrderId` varchar(48) DEFAULT NULL COMMENT '外部订单号(下游商户请求参数,用户数据回调)',
                                `dealDescribe` text COMMENT '交易备注',
                                `notify` varchar(128) DEFAULT NULL COMMENT '订单异步回调地址',
                                `back` varchar(128) DEFAULT NULL COMMENT '订单同步回调地址',
                                `isNotify` varchar(3) NOT NULL DEFAULT 'NO' COMMENT '是否發送通知 //  YES 已發送    NO 未發送',
                                `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据生成时间（该时间等同于交易时间）',
                                `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据修改时间',
                                `product` varchar(28) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单交易产品类型',
                                `profit` decimal(19,6) DEFAULT NULL COMMENT '当前订单系统盈利',
                                `settlement` int(2) NOT NULL DEFAULT '1' COMMENT '1为订单成功未结算，2为订单成功已结算',
                                `currency` varchar(5) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
                                `payInfo` varchar(100) DEFAULT NULL COMMENT '回调详情',
                                `operater` varchar(16) DEFAULT NULL COMMENT '操作人',
                                `recordType` varchar(16) DEFAULT NULL COMMENT '记录类型',
                                `systemAmount` decimal(19,4) DEFAULT '0.0000' COMMENT '系统业务余额',
                                PRIMARY KEY (`id`),
                                UNIQUE KEY `orderId` (`orderId`),
                                KEY `idx_associatedId` (`associatedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代付订单表';






-- pay.pay_merchant_info definition

CREATE TABLE `pay_merchant_info` (
                                     `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                     `userId` varchar(32) NOT NULL COMMENT '用户id【登录账号】',
                                     `userName` varchar(32) NOT NULL COMMENT '用户昵称',
                                     `password` varchar(128) NOT NULL COMMENT 'shiro加密秘钥【登录】',
                                     `payPasword` varchar(256) NOT NULL COMMENT 'shiro加密秘钥【资金】【商户则为交易秘钥】',
                                     `salt` varchar(32) DEFAULT NULL COMMENT '秘钥加密盐值【加密算法】',
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `user` (`userId`),
                                     UNIQUE KEY `username` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户详情表';






-- pay.pay_merchant_rate definition

CREATE TABLE `pay_merchant_rate` (
                                     `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                     `userId` varchar(32) NOT NULL COMMENT '用户id【登录账号】',
                                     `switchs` int(2) NOT NULL DEFAULT '1' COMMENT '当前用户总开关 1开启0关闭【码商商户后台控制,该数据只能在后台显示】',
                                     `payType` char(32) DEFAULT NULL COMMENT '产品类型',
                                     `fee` decimal(19,6) NOT NULL DEFAULT '0.000000' COMMENT '费率数值',
                                     `feeType` int(2) NOT NULL COMMENT '费率类型:1交易费率，2代付费率',
                                     `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
                                     `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次数据修改时间',
                                     `limitMountMax` decimal(19,2) DEFAULT '5000.00' COMMENT '限制金额',
                                     `limitMountMin` decimal(19,2) DEFAULT '500.00' COMMENT '限制金额',
                                     `channelInfo` text NOT NULL COMMENT '渠道情况 格式： [ {channelId  : xxx , priority ： 1 },{channelId  : xxx , priority ： 2} ,{channelId  : xxx , priority ： 3}]',
                                     `deci` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 是默认整数金额，1是小数金额',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户产品费率表';






-- pay.pay_merchant_role definition

CREATE TABLE `pay_merchant_role` (
                                     `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                     `userId` varchar(32) NOT NULL COMMENT '用户id【登录账号】',
                                     `switchs` int(2) NOT NULL DEFAULT '1' COMMENT '当前用户总开关 1开启0关闭',
                                     `userNode` varchar(128) DEFAULT '未添加' COMMENT '组群备注,如果为渠道账户则为渠道商户号',
                                     `agent` varchar(24) DEFAULT NULL COMMENT '代理商id',
                                     `isAgent` char(3) DEFAULT NULL COMMENT '是否为代理商:1代理商2普通商户',
                                     `receiveOrderState` int(2) NOT NULL DEFAULT '0' COMMENT '是否处于入款接单状态 1 接单 0 暂停接单',
                                     `remitOrderState` int(2) NOT NULL DEFAULT '0' COMMENT '是否处于出款接单状态 1 接单 0 暂停接单',
                                     `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
                                     `submitTime` datetime DEFAULT NULL COMMENT '最后一次数据修改时间',
                                     `privateKey` text COMMENT '商户私钥',
                                     `publicKey` text COMMENT '商户公钥',
                                     `startTime` varchar(10) DEFAULT NULL COMMENT '限制时间-开始时间',
                                     `endTime` varchar(10) DEFAULT NULL COMMENT '限制时间-结束时间',
                                     `witip` text COMMENT '代付ip白名单',
                                     `dealUrl` text COMMENT '商户配置网关',
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户权限控制';







-- pay.pay_run_order definition

CREATE TABLE `pay_run_order` (
                                 `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                 `orderId` char(48) NOT NULL COMMENT '流水订单id(全局唯一索引)',
                                 `associatedId` char(48) NOT NULL COMMENT '关联订单号(普通索引)',
                                 `orderAccount` char(32) NOT NULL COMMENT '关联账户',
                                 `runOrderType` int(2) DEFAULT NULL COMMENT '流水类型',
                                 `amount` decimal(19,2) DEFAULT NULL COMMENT '流水金额',
                                 `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
                                 `submitTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据最近一次修改时间',
                                 `amountType` char(2) DEFAULT NULL COMMENT '1支出,0收入',
                                 `amountNow` decimal(19,2) DEFAULT NULL COMMENT '当前账户余额',
                                 `dealDescribe` text NOT NULL COMMENT '流水描述',
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `orderId` (`orderId`),
                                 KEY `associatedId` (`associatedId`),
                                 KEY `orderAccount` (`orderAccount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流水订单记录表';







-- pay.pay_user_fund definition

CREATE TABLE `pay_user_fund` (
                                 `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '数据id',
                                 `userId` varchar(24) NOT NULL COMMENT '主账号id',
                                 `fundId` varchar(24) NOT NULL COMMENT '子账号id',
                                 `accountType` varchar(24) NOT NULL COMMENT '账户类型',
                                 `balance` decimal(19,4) NOT NULL DEFAULT '0.0000' COMMENT '账户余额',
                                 `role` int(32) NOT NULL DEFAULT '0' COMMENT '账户规则： 0 减账户 1 加账户',
                                 `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
                                 `version` int(18) DEFAULT '0' COMMENT '数据版本号【数据修改锁】',
                                 `currency` varchar(12) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `user` (`userId`,`accountType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户资金账户表';








-- pay.pay_wit_app definition

CREATE TABLE `pay_deal_wit_app` (
                               `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '商户后台管理员',
                               `orderId` char(48) NOT NULL COMMENT '会员提现单号',
                               `userId` varchar(32) NOT NULL COMMENT '会员id(唯一识别号)(index索引)',
                               `withdrawType` int(2) NOT NULL COMMENT '商户提现1，码商提现2',
                               `bankNo` varchar(199) DEFAULT NULL COMMENT '银行卡号',
                               `accname` varchar(199) DEFAULT NULL COMMENT '提款人姓名',
                               `orderStatus` char(3) NOT NULL COMMENT ' 1处理中2成功3失败4已推送处理',
                               `bankName` varchar(199) DEFAULT NULL COMMENT '银行昵称，如中国银行',
                               `amount` varchar(199) DEFAULT NULL,
                               `fee` varchar(199) DEFAULT NULL,
                               `actualAmount` varchar(199) DEFAULT NULL,
                               `notify` varchar(126) DEFAULT NULL COMMENT '提现成功回调地址',
                               `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '数据创建时间',
                               `submitTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '数据修改时间',
                               `witType` varchar(24) DEFAULT NULL COMMENT '代付产品类型',
                               `witChannel` varchar(32) DEFAULT NULL COMMENT '代付渠道',
                               `appOrderId` varchar(42) DEFAULT NULL COMMENT '代付下游商户订单号',
                               `witsource` char(5) DEFAULT NULL COMMENT '代付来源  1api,2后台,3码商客户端',
                               `ip` char(24) DEFAULT NULL COMMENT '代付发起ip地址',
                               `bankcode` varchar(24) DEFAULT NULL COMMENT '如果是银行代付 银行标识号',
                               `currency` varchar(5) NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
                               `pushOrder` int(2) NOT NULL DEFAULT '1' COMMENT '是否推送代付订单， 1 已推送  0 未推送，默认为已推送',
                               `sgin` varchar(199) DEFAULT NULL,
                               `macthLock` int(3) DEFAULT '0' COMMENT '锁定订单不可以进行任何操作，  默认不锁定 0    1 锁定',
                               `watingTime` int(24) DEFAULT '600' COMMENT '默认等待处理时间',
                               `payStatus` int(3) DEFAULT '0' COMMENT '结算状态  1 已扣款结算   0 未扣款结算',
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `order` (`orderId`),
                               UNIQUE KEY `orderId_2` (`orderId`,`orderStatus`),
                               UNIQUE KEY `orderapp` (`appOrderId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';