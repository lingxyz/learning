  ### hack 方法：
  ```css
  /* 条件注释法 */
<!--[if IE 6]>
<link type="text/css" rel="stylesheet" href="ie6.css" />
<![endif]-->

/* 选择器前缀法 */
*html element {}

/* 属性前缀法 */
.test {
     width: 80px;
     *width: 70px; /*IE 6,IE 7*/
     _width: 60px; /*only for IE 6*/
}
```

- IE6的双倍边距bug

盒对象为浮动状态时，盒对象的左右margin会加倍

原因：IE6css解析问题

解决：设置对象的`display: inline;`

- height 按照 min-height 解析

在 IE 7 发布之前，通过 `height: 1%` 来触发 IE 的 hasLayout

IE 7 发布之后，采用 `zoom: 1` 触发

- 不支持 display: table-cell

- select 元素的显示问题：select 元素会浮在绝对定位的元素之上

解决方案：用一个和绝对定位的元素同样大小的 iframe 放在该元素下面，select 上面，用 iframe 遮住 select

```html
<div id="test"></div>
<iframe id="testMask" frameborder="0" scrolling="no"></iframe>
<select>
    <option>-请选择-</option>
</select>
```
```css
 #test {
     width: 200px;
     height: 200px;
     background: green;
     position: absolute;
     left: 50px;
     top: 10px;
     z-index: 2;
}
#testMask {
    width: 200px;
    height: 200px;
    position: absolute;
    left: 50px;
    top: 10px;
    z-index: 1;
}
  ```

- png24位的图片在iE6浏览器上出现背景，解决方案是做成PNG8.也可以引用一段脚本处理
