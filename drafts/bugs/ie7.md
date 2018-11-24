- display:inline-block; 在IE7不兼容

方案1：
```css
div {
    display: inline-block;  // 触发layout
    display: inline;
    zoom: 1;                // 可设高宽
}
```
方案2：
```css
div {
    display: inline-block;
}
div {
    display: inline;
}
```

- hack 方法：
```css
/* 条件注释法 */
<!--[if IE 7]>
<link type="text/css" rel="stylesheet" href="ie7.css" />
<![endif]-->

/* 选择器前缀法 */
*+html .test {
    width: 70px;
}

/* 属性前缀法 */      
.test {
    width: 80px;
    *width: 70px; /*IE 6,IE 7*/
}
```

- 不支持 display: table-cell
