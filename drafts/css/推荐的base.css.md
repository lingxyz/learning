CSS是分层的。base层是高度重用的基础层，各网站通用。

推荐的base.css: css reset + 通用原子类

```css
/*
* base.css
* 一个属性单行，超过一个多行
*/
/*CSS reset*/
body,div,
dl,dt,dd,
ul,ol,li,
h1,h2,h3,h4,h5,h6,
pre,form,fieldset,
input,textarea,p,blockquote,th,td {
    margin: 0;
    padding: 0;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}
fieldset,img {border: 0;}
address,caption,cite,code,dfn,em,strong,th,var {
	font-style: normal;
	font-weight: normal;
}
ol,ul {list-style: none;}
caption,th {text-align: left;}
h1,h2,h3,h4,h5,h6 {
	font-size: 100%;
	font-weight: normal;
}
q:before,q:after {content: '';}
abbr,acronym {border: 0;}
/*font*/
.f12 {font-size: 12px;}
.f13 {font-size: 13px;}
.f14 {font-size: 14px;}
.f16 {font-size: 16px;}
.f20 {font-size: 20px;}
.fb {font-weight: bold;}
.fn {font-weight: normal;}
.t2 {text-indent: 2em;}
.lh150 {line-height: 150%;}
.lh180 {line-height: 180%;}
.lh200 {line-height: 200%;}
.unl {text-decoration: underline;}
.no_unl {text-decoration: none;}
/*position*/
.tl {text-align: left;}
.tc {text-align: center;}
.tr {text-align: right;}
.bc {
	margin-left: auto;
	margin-right: auto;
}
.fl {
	float: left;
	display: inline;
}
.fr {
	float: right;
	display: inline;
}
.cl {clear: left;}
.cr {clear: right;}
.cb {clear: both;}
.clearfix {display: inline-block;}
* html .clearfix {height: 1%;}
.Clearfix {display: block;}
.clearfix:after {
	content: '.';
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}
.vm {vertical-align: middle;}
.pr {position: relative;}
.pa {position: absolute;}
.abs-right {
	position: absolute;
	right: 0;
}
.zoom {zoom: 1;}
.hidden {visibility: hidden;}
.none {display: none;}
/*size*/
.w {width: 100%}
.w10 {width: 10px;}
.w20 {width: 20px;}
.w30 {width: 30px;}
.w40 {width: 40px;}
.w50 {width: 50px;}
.w60 {width: 60px;}
.w70 {width: 70px;}
.w80 {width: 80px;}
.w90 {width: 90px;}
.w100 {width: 100px;}
.w200 {width: 200px;}
.w250 {width: 250px;}
.w300 {width: 300px;}
.w400 {width: 400px;}
.w500 {width: 500px;}
.w600 {width: 600px;}
.w700 {width: 700px;}
.w800 {width: 800px;}
.h {height: 100%;}
.h50 {height: 50px;}
.h80 {height: 80px;}
.h100 {height: 100px;}
.h200 {height: 200x;}
/*margin && padding*/
.m10 {margin: 10px;}
.m15 {margin: 15px;}
.m30 {margin: 30px;}
.mt5 {margin-top: 5px;}
.mt10 {margin-top:10px;}
.mt15 {margin-top: 15px;}
.mt20 {margin-top: 20px;}
.mt30 {margin-top: 30px;}
.mt50 {margin-top: 50px;}
.mt100 {margin-top: 100px;}
.mr5 {margin-right: 5px;}
.mr10 {margin-right:10px;}
.mr15 {margin-right: 15px;}
.mr20 {margin-right: 20px;}
.mr30 {margin-right: 30px;}
.mr50 {margin-right: 50px;}
.mr100 {margin-right: 100px;}
.mb5 {margin-bottom: 5px;}
.mb10 {margin-bottom:10px;}
.mb15 {margin-bottom: 15px;}
.mb20 {margin-bottom: 20px;}
.mb30 {margin-bottom: 30px;}
.mb50 {margin-bottom: 50px;}
.mb100 {margin-bottom: 100px;}
.ml5 {margin-left: 5px;}
.ml10 {margin-left:10px;}
.ml15 {margin-left: 15px;}
.ml20 {margin-left: 20px;}
.ml30 {margin-left: 30px;}
.ml50 {margin-left: 50px;}
.ml100 {margin-left: 100px;}
.p10 {padding: 10px;}
.p15 {padding: 15px;}
.p30 {padding: 30px;}
.pt5 {padding-top: 5px;}
.pt10 {padding-top:10px;}
.pt15 {padding-top: 15px;}
.pt20 {padding-top: 20px;}
.pt30 {padding-top: 30px;}
.pt50 {padding-top: 50px;}
.pt100 {padding-top: 100px;}
.pr5 {padding-right: 5px;}
.pr10 {padding-right:10px;}
.pr15 {padding-right: 15px;}
.pr20 {padding-right: 20px;}
.pr30 {padding-right: 30px;}
.pr50 {padding-right: 50px;}
.pr100 {padding-right: 100px;}
.pb5 {padding-bottom: 5px;}
.pb10 {padding-bottom:10px;}
.pb15 {padding-bottom: 15px;}
.pb20 {padding-bottom: 20px;}
.pb30 {padding-bottom: 30px;}
.pb50 {padding-bottom: 50px;}
.pb100 {padding-bottom: 100px;}
.pl5 {padding-left: 5px;}
.pl10 {padding-left:10px;}
.pl15 {padding-left: 15px;}
.pl20 {padding-left: 20px;}
.pl30 {padding-left: 30px;}
.pl50 {padding-left: 50px;}
.pl100 {padding-left: 100px;}
```

HTML 标签存在默认样式

不同的浏览器的默认样式也有差别，例如：
    ul 的默认缩进，在 IE 下，是通过 margin 实现的，在 Firefox 下，通过 padding 实现。

CSS reset，用重新定义的样式覆盖掉浏览器默认样式，提高开发效率。

最早的 CSS reset：
```css
* {
    margin: 0;
    padding: 0;
}
```
不完善的原因：
1. HTML 标签默认的其他属性没有得到去除。
2. “*”是通配符，包括大量生僻标签和淘汰标签。

为什么没有加上颜色，大小等过多的属性，而只选择原子类？

CSS 很多样式具有继承性，权重很低，比标签选择符更低。会破坏CSS的继承性，page层会额外增加很多代码。

为什么对于浮动的元素加display:inline;？

解决IE6 的双外边距bug：在 IE6 下，如果对元素同时设置了浮动和左边距或者右边距，那么边距会加倍。

`.zoom{zoom:1;}`触发 IE 的hasLayout。在 IE7 出来之前，一般通过height: 1%; 来触发，因为 IE6 默认将 height 解析成 min-height，不会引入副作用。但是 IE7 发布后就不适用了，采用zoom: 1;

m5,m10 这些虽然繁杂，但是可以大量减少page层的代码量。
