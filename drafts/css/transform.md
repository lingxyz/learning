# css3-变形-transform

## 兼容性问题：
```css
-webkit-
-moz-
-mos-
-o-
```

## 旋转：
```css
rotate(30deg) //旋转30°
1.指定旋转角度，正值顺时针，负值逆时针
2.默认按元素中心点旋转
3.不改变元素的形状
```

## 扭曲：
```css
skew(x,y) //[skju:]  y为可选参数，参数为一个时，指按X方向扭曲
skewX(x)
skewY(y)
1.使元素按照X、Y轴扭曲变形
2.x为正时，上左下右。y为正时，左上右下
3.设置扭曲内的元素会跟着一起扭曲，若要求其不扭曲，可给子元素设置反向扭曲值
```

## 缩放：
```css
scale(x,y) //y为可选参数，参数为一个时，x = y
skewX(x)
skewY(y)
1.默认 x=y=1
2.0< x/y <1 缩小 x/y>1放大
```

## 位移：
```css
translate(x,y) //y为可选参数，参数为一个时，x = y
translateX(x)
translateY(y)
1.改变元素的位置，正值默认往右下方移动
2.将不知道尺寸的元素实现水平垂直居中：
 	top\margin-top: 50%;
 	left\margin-left: 50%;
 	transform: translate(-50%,-50%);  //-webkit- / -moz- / -ms- / -o-
```

## 矩阵：
```css
matrix(a,b,c,d,e,f) //['meitriks]  y为可选参数，参数为一个时，指按X方向扭曲
1.指定一个2D变换（改变元素的位置）
```

## 原点：
```css
transform-origin: x y
1.改变元素默认中心点，默认为50% 50%/center
2.支持关键词定义，left/right/top/bottom/center
3.支持百分比定义：50% 0/50%
```