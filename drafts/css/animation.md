# css3-动画-animation
=====================
### keyframes: 关键帧
```css
@keyframes [name] {
	from(0%) {

	}
	to(100%) {

	}
}

form to 可以用 0%,100% 代替

浏览器兼容性：
	-webkit-	/*Chrome && Safari*/
	-moz-	/*Firefox*/
 	-o-	/*Opera*/
```
===================================================
### animation: name duration timing-function delay;
```css
浏览器兼容性：
	-webkit- 	/*Chrome && Safari*/
	-moz- 	/*Firefox*/
 	-o-		/*Opera*/
```

* 一个例子
```css
div {
	width: 100px;
	height: 100px;
	background: red;
}
@keyframes changeWidth {
	0% {
		width: 100px;
		background: red;
	}
	50% {
		width: 600px;
		background: blue;
	}
	100% {
		width: 100px;
		background: red;
	}
}
-webkit- -moz- -o- ...

div:hover {
	animation: changeWidth 5s ease .1s;
	-webkit- -moz- -o- ...
}
```
============================
### animation-name: 调用动画
```css
animation-name: none | IDENT

IDENT是由@keyframes创建的动画名
none为默认值，可用于覆盖任何动画
```
====================================
### animation-duration: 动画播放时间
===========================================
### animation-timing-function: 动画播放方式
```css
ease
linear
ease-in
ease-out
ease-in-out
```
=======================================
### animation-delay: 动画开始播放的时间
==========================================================
* 以上四个属性类似于 transition, animation 还具有以下属性：

### animation-iteration-count: 动画播放次数
```css
animation-iteration-count: infinite | number
	infinite: 无限循环播放
	number: 常为整数，也可为小数，默认为1
```
======================
and so on ...
累了
未完待续...
