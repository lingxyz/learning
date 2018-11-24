- 一列固定宽度
```html
<div id="layout">1列固定宽度</div>
```
```css
#layout {
	background-color: #ccc;
	border: 2px solid #333;
	width: 300px;
	height: 300px;
}
```

- 一列宽度自适应
```css
#layout {
	background-color: #ccc;
	border: 2px solid #333;
	width: 80%;
	height: 300px;
}
```
- 一列固定宽度居中
```css
#layout {
	background-color: #ccc;
	border: 2px solid #333;
	width: 300px;
	height: 300px;
	margin: 0 auto;
}
```

- 二列固定宽度
```html
<div id="left">左列</div>
<div id="right">右列</div>
```
```css
#left,#right {
	background-color: #ccc;
	border: 2px solid #333;
	width: 300px;
	height: 300px;
	float: left;
}
```

- 二列宽度自适应
```css
#left,#right {
	background-color: #ccc;
	border: 2px solid #333;
	width: 20%;
	height: 300px;
	float: left;
}
#right {
	width: 70%;
}
```

- 二列右列宽度自适应
```css
#left {
	background-color: #ccc;
	border: 2px solid #333;
	width: 100px;
	height: 300px;
	float: left;
}
#right {
	background-color: #ccc;
	border: 2px solid #333;
	height: 300px;
}
```

- 二列固定宽度居中
```html
<div id="layout">
    <div id="left">左列</div>
    <div id="right">右列</div>
</div>
```
```css
#layout {
	margin: 0 auto;
	width: 408px;
}
#left,#right {
	background-color: #ccc;
	border: 2px solid #333;
	width: 200px;
	height: 300px;
	float: left;
}
```

- 三列中间宽度自适应
```html
<div id="left">左列</div>
<div id="center">中间自适应</div>
<div id="right">右列</div>
```
```css
#left,#right,#center {
	background: #ccc;
	border: 2px solid #333;
    height: 300px;
}
#left,#right {
	width: 200px;
	position: absolute;
	top: 0;
}
#left {
	left: 0;
}
#right {
	right: 0;
}
#center {
	margin: 0 204px;
}
```

- 高度自适应
```css
html,body {
    margin: 0;
    height: 100%;
}
#left {
    background-color: #ccc;
    width: 300px;
    height: 100%;
    float: left;
}
```

给body设置height: 100%的原因：

        子元素的自适应高度取决于父元素

给html设置height: 100%的原因：

在 IE中，html 高度默认为100%，body 不是。

在 Firefox 中，html 高度默认不是100%。


自己总结：div 默认宽度100%，或者100%-element(float)

           float 为了设置文字环绕效果，设置了float会丢失宽高，等于加了属性display: inline-block,所以设置float的块状元素必须设置宽高
