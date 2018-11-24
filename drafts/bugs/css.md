- `css reset`：浏览器默认的margin和padding不同。

在 IE中，html 高度默认为100%，body 不是。
在 Firefox 中，html 高度默认不是100%。

所以在设置高度自适应时：
html, body {height: 100%;}

若要统一所有元素，解决方案是加一个全局的*{margin:0;padding:0;}来统一

- 上下margin叠加

现象：当上下边距重合时，间距取大值显示

原因：css设计问题

解决：只用上边距或者下边距

PS：设置float属性之后 不再进行空白边叠加

- 条件注释缺点：在IE浏览器下可能会增加额外的HTTP请求数

- 超链接访问过后hover样式就不出现了 被点击访问过的超链接样式不在具有hover和active了解决方法是改变CSS属性的排列顺序:
L-V-H-A : `a:link {} a:visited {} a:hover {} a:active {}`

- 怪异模式问题：漏写DTD声明，Firefox仍然会按照标准模式来解析网页，但在IE中会触发怪异模式。为避免怪异模式给我们带来不必要的麻烦，最好养成书写DTD声明的好习惯。现在可以使用[html5](http://www.w3.org/TR/html5/single-page.html)推荐的写法：`<doctype html>`
