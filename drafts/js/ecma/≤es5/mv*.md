复杂的软件必须有清晰合理的架构，否则无法开发和维护。

MVC（Model-View-Controller）是最常见的软件架构之一，业界有着广泛应用。它本身很容易理解，但是要区分它与衍生的 MVP 和 MVVM 架构就不容易了。

### 一、MVC

MVC（Model-View-Controller）模式，即：

> - 模型（Model）：数据保存
> - 视图（View）：用户界面。
> - 控制器（Controller）：业务逻辑

单向通信：
![MVC](http://image.beekka.com/blog/2015/bg2015020105.png)

> 1.View 传送指令到 Controller
> 2.Controller 完成业务逻辑后，要求 Model 改变状态
> 3.Model 将新的数据发送到 View，用户得到反馈

接受指令时，由view接受，传递给controller，或者由controller直接接受指令。

**实例（Backbone）：**
![MVC-backbone](http://image.beekka.com/blog/2015/bg2015020108.png)

> 1. 用户可以向 View 发送指令（DOM 事件），再由 View 直接要求 Model 改变状态。
> 2. 用户也可以直接向 Controller 发送指令（改变 URL 触发 hashChange 事件），再由 Controller 发送给 View。
> 3. Controller 非常薄，只起到路由的作用，而 View 非常厚，业务逻辑都部署在 View。所以，Backbone 索性取消了 Controller，只保留一个 Router（路由器） 。
### 二、MVP

将MVC模式的Controller 改名为 Presenter，同时改变了通信方向，即为MVP（Model-View-Presenter）模式。
![MVP](https://cloud.githubusercontent.com/assets/9364793/13388021/7103bd56-def7-11e5-8bec-1ca4c069d2ee.png)

> 1. 各部分之间的通信，都是**双向**的。
> 2. View 与 Model 不发生联系，都通过 Presenter 传递。
> 3. **View 非常薄**，不部署任何业务逻辑，称为"被动视图"（Passive View），即没有任何主动性，而 Presenter非常厚，所有逻辑都部署在那里。
### 三、MVVM

将MVP模式采用双向绑定（data-binding）,就变成了MVVM（Model-View-ViewModel）模式。
![MVVM](http://image.beekka.com/blog/2015/bg2015020110.png)
View层的变动，会同步反映在ViewModel中，反之亦然。代表的框架有[Angular](https://angularjs.org/)和[Ember](http://emberjs.com/)。

_参考资料_
- [《Scaling Isomorphic Javascript Code》](http://blog.nodejitsu.com/scaling-isomorphic-javascript-code/)
- [MVC，MVP 和 MVVM 的图示](http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html)
- [前端MV*框架的意义](http://www.ituring.com.cn/article/59237)
- [自己理解前端MV*](http://www.tuicool.com/articles/aMza63b)
