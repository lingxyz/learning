# HTML
- 什么是 Doctype？有几种模式？ `HTML` `Doctype`
```
- 标准模式：严格型（strict 4.0 strict 1.0 !Doctype html）
- 准标准模式：过度型(Transitional 4.0 Transitional 1.0) 
- 框架集型(Frameset 4.0 Frameset 1.0)
```
- JS 延迟加载和异步加载的区别？ `HTML` `资源加载`
```js
// 延迟到文档完全加载或解析后执行脚本
<script src="" defer="defer"></script>
// 等同于在</body>前引入脚本

h5 会忽略 defer 属性，只在 IE4-7有效
H5 规范要求按照顺序执行，并且先于`DOMContentLoaded`（HTML等文档解析完毕）事件之前执行，但实际中不是。
所以，实际中最好只有一个脚本用 defter 属性延迟加载

----

异步加载 `async` ，表示立即下载，但不妨碍页面中的其他操作
标记为 async 的脚本并不保证按顺序执行，所以要确保两者之间不会相互依赖。
确保不会修改DOM。
异步脚本一定会在 load 事件前执行，但是可能会在DOMContentLoaded 事件触发之前或之后执行。
```
- HTML `模板` ☆
- Pug `模板` `预编译器` ☆

- code split 怎么做？`性能`
- 什么是treeshaking？注意些什么？`性能`

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