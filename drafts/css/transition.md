# css3-动画-transtion
===================
* Web 动画实现的方式
```
1.Flash
2.JavaScrip: 硬件加速
3.CSS3: 通过鼠标的单击、获得焦点、被点击或对元素的任何改变来触发，并平滑得以动画效果改变CSS属性值
```

## transition: property duration timing-function delay;
```css
transition-property: 制定过度或动态模拟的css属性，若不清楚或图省事可用all
transtion-duration: 指定完成过度所需的时间
transtion-timing-function: 指定过度函数
transition-delay: 指定开始出现的延迟时间
```

* 例1：一个属性：鼠标移入改变div长度
```css
div {
	width: 100px;
	height: 100px;
	background: red;
	transition: width .5s ease .1s;
	-webkit-transition: width .5s ease .1s;
}

div:hover {
	width: 200px;
}
```

* 例2：多个属性：鼠标移入改变div长度和背景色
```css
div {
	width: 100px;
	height: 100px;
	background: red;
	transition: width .5s ease .1s, background .8s ease .2s;
	-webkit-transition: width .5s ease .1s, background .8s ease .2s;
}

div:hover {
	width: 200px;
	background: blue;
}
```

## 动画过度属性 transition-timing-function
```css
ease: 默认，由快到慢，且逐渐变慢
linear: 恒速
ease-in: 由慢到快，加速，常称为渐显效果
ease-out: 由快到慢，减速，常称为渐隐效果
ease-in-out: 先加速再减速，常称为渐显渐隐效果
```
