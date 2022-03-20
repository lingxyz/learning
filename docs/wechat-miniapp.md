# 权限
- 小程序 access_token 有哪些？分别是做什么的？
```
接口调用凭证 access_token
？？？
```

- [获取接口调用凭证 access_token。](https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/access-token/auth.getAccessToken.html)
```
请求地址：GET https://api.weixin.qq.com/cgi-bin/token
入参：?grant_type=client_credential&appid=APPID&secret=APPSECRET
出参：access_token、expires_in 有效时间，默认7200秒
```
- 刷新access_token需要注意哪些问题？
```
> access_token有效期2h，redis中存储的过期时间需要＜2h。
> 集群状态下，重复刷新问题 → 使用中控服务器统一获取和刷新 access_token。
> 中控服务器需要提供主动刷新（检测redis已过期）和被动调用刷新两个功能（第三方服务调用微信接口时返回token已过期，回调此接口）。
> 高并发场景下，异步重复刷新问题→一个服务检测到token过期，异步调用中控服务器刷新token未返回时，多个三方服务检测到token过期，重复调用中控服务器，造成重复刷新。→ 请求堆积，每5分钟只刷新1次。（微信在刷新过程中，5分钟内，新老token都可用。）
```

# 登录
- 获取openid和unionid：
① [wx.login获取code](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/login/wx.login.html) →
② [code2Session获取openid & unionid](https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/login/auth.code2Session.html)
```
openid获取步骤：前端获取code→后端获取openid。
unionid获取条件：将小程序绑定到微信开放平台。
```

# 用户信息
- 获取用户信息
  - [通过wx.getUserProfile(JS API)获取用户信息](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/user-info/wx.getUserProfile.html) `需要用户手动授权`
  - [头像昵称填写](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/userProfile.html)
  - 废弃的方式：[通过wx.getUserInfo获取用户信息](https://developers.weixin.qq.com/miniprogram/dev/api/open-api/user-info/wx.getUserInfo.html) / [通过open-data组件展示信息](https://developers.weixin.qq.com/miniprogram/dev/component/open-data.html)

- 获取手机号：
① [button组件获取code](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/getPhoneNumber.html) →
② [code + access_token获取手机号](https://developers.weixin.qq.com/miniprogram/dev/api-backend/open-api/phonenumber/phonenumber.getPhoneNumber.html)
```
获取手机号的button组件，最好做成独立页面，方便复用。
跳转到button组件的页面时，带入来源和跳转参数。若用户授权（继续下一步）和用户拒绝授权（不允许使用？游客模式？）的处理场景。
```

# 分享
- [分享到好友](https://developers.weixin.qq.com/miniprogram/dev/reference/api/Page.html#onShareAppMessage-Object-object)
- [分享到朋友圈](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/share-timeline.html)
```
> 满足2个条件：1.设置Page.onShareAppMessage允许分享给朋友 2. 设置Page.onShareTimeline允许分享到朋友圈。
> 单页模式：朋友圈打开的小程序页面是单页模式，存在限制。适配时在开发者工具`添加编译模式-场景值`为1154。
```

# 设备
- [小程序扫码查询-wx.scanCode](https://developers.weixin.qq.com/miniprogram/dev/api/device/scan/wx.scanCode.html)
- [微信扫码打开小程序](https://developers.weixin.qq.com/miniprogram/introduction/qrcode.html)
```
> 二维码生成：普通域名链接（支持子路径和params），携带参数，生成二维码。
> 小程序配置：开发者在小程序后台 `设置-开发设置-扫普通链接二维码打开小程序` 配置二维码规则（域名路径）。
> 获取二维码信息：在小程序入口文件 `App.vue` onLoad时接收query参数。根据解析出的内容执行业务逻辑（跳转页面 / 请求接口 /展示不同内容等）。
Page({
  onLoad(query) {
    const q = decodeURIComponent(query.q) // 获取到二维码原始链接内容
    const scancode_time = parseInt(query.scancode_time) // 获取用户扫码时间 UNIX 时间戳
  }
})
```

# 开放能力
- [关注公众号组件official-account](https://developers.weixin.qq.com/miniprogram/dev/component/official-account.html) `注意冷/热启动场景限制，如扫码查询1011`