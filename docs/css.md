# [样式](css/style.md)

# [布局](css/layout.md)

# [动画](css/animation.md)

# [渲染](css/webkit.md)

# [架构设计](css/design.md)

# CSS
- CSS 样式优先级计算规则（权重） `CSS选择器`
```
行内样式（1000） > 内联样式 > 外联样式
!important > id (100) > class(10) > element/伪元素(1) > */>/+(0)
```
- [CSS 不同盒模型的区别？如何改变盒模型？](https://www.cnblogs.com/chengzp/p/cssbox.html) `CSS` `盒模型`
```
box-sizing:content-box border-box标准模式 怪异模式（ie5-6 未指定doctype的ie7-8）
标准width=content
怪异width content + padding + border
如何避免怪异模式影响
在父元素设置border padding
```
- 实现一个两栏布局有哪些方式？`布局`
- 实现一个三栏布局有哪些方式？`布局`
- [实现水平垂直居中有哪些方式？](https://blog.csdn.net/mrwangweijin/article/details/79760884) `布局`
- position 有几种属性？区别是什么？`布局`
- 说一说你对 z-index 的理解 `布局`
- 什么是浮动？如何利用浮动对 CSS 进行布局？如何清除浮动？`布局`
- Flexbox 布局 `布局`
- [CSS 有哪些 hack 方式？](https://blog.csdn.net/freshlover/article/details/12132801) `兼容性`
- CSS 重绘和回流有什么区别？怎样减少？ `渲染`
```
重绘：样式变化
回流：DOM结构或位置变化，自上而下
触发：任何引起dom变化和样式变化的行为
降低：多个样式放在class里，一次改变，用position:absolute和fixed处理动画父元素等
```
- `Flex` flex-grow 和 flex-shrink，flex-direction
- vertical-align 为什么没有绝对垂直居中？
- line-height 的具体含义是什么？

- CSS `样式` ☆
- Stylus `样式` `预编译器` ☆☆
- Sass `样式` `预编译器` ☆☆
- Less `样式` `预编译器` ☆☆
