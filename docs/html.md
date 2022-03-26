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