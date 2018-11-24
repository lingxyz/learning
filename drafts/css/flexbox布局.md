网页布局（layout）是 CSS 的一个重点应用。   
![image](http://www.ruanyifeng.com/blogimg/asset/2015/bg2015071001.gif)   
传统的布局方案，基于盒模型，依赖 display + position + float 属性，不过有局限性。比如垂直居中的实现比较困难。

2009年，W3C 提出了一种新的方案 —— Flex 布局，可以简便、完整、响应式地实现各种页面布局。目前，它已经得到了所有浏览器的支持（高级版本）。

![image](http://www.ruanyifeng.com/blogimg/asset/2015/bg2015071003.jpg)

## Flex 布局
Flex（Flexible Box）意为"弹性布局"，用来为盒状模型提供最大的灵活性。  
任何一个容器都可以指定为Flex布局。
```css
/* 块状元素 */
.box {
    display: flex;
    /* Webkit内核的浏览器，必须加上-webkit前缀 */
    display: -webkit-flex;  /* Safari */
}

/* 行内元素 */
.box {
    display: inline-flex;
    display: -webkit-flex;
}
```
设为Flex布局以后，子元素的 ``float``、``clear`` 和 ``vertical-align`` 属性将失效。

## 基本概念
一张图看懂 Flexbox包括哪些内容  
![image](http://www.ruanyifeng.com/blogimg/asset/2015/bg2015071004.png)
- flex container -- flex 容器
- flex item -- 容器的子元素，简称“项目”
- main axis -- 容器主轴
- cross axis -- 垂直的交叉轴
- main start -- 主轴开始位置
- main end -- 主轴结束位置
- cross start -- 交叉轴开始位置
- cross end -- 交叉轴结束位置
- main size -- 单个项目占据的主轴空间
- cross size -- 单个项目占据的交叉轴空间    
==项目默认沿主轴排列==

## 容器的属性
> ==flex-direction== 主轴的方向，即项目排列方向

- row（默认值）：主轴为水平方向，起点在左端

itemA|——>|itemB|——>|itemC
-|-|-|-|-

- row-reverse：主轴为水平方向，起点在右端

itemC|<——|itemB|<——|itemA
-|-|-|-|-

- column：主轴为垂直方向，起点在上沿

itemA|
-|-
丨|
itemB|
丨|
itemC|

- column-reverse：主轴为垂直方向，起点在下沿

> ==flex-wrap== 定义项目在一条轴线排不下时，如何换行。默认不换行。

- nowrap（默认）：不换行
- wrap：自上而下换行

A|——>|B|——>|C|——>|D|——>|E|——>|F
-|-|-|-|-|-|-|-|-|-|-
|G|——>|H|——>|I|——>|J|——>|K|——>|L

- wrap-reverse：自下而上换行

|G|——>|H|——>|I|——>|J|——>|K|——>|L
-|-|-|-|-|-|-|-|-|-|-
A|——>|B|——>|C|——>|D|——>|E|——>|F

> ==flex-flow== 属性是flex-direction属性和flex-wrap属性的简写形式，默认值为row nowrap

> ==justify-content== 属性定义了项目在主轴上的对齐方式

- flex-start（默认值）：左对齐

A|B|C|D| | | | |
-|-|-|-|-|-|-|-
- flex-end：右对齐

 | | | | |A|B|C|D
-|-|-|-|-|-|-|-
- center： 居中

 | | |A|B|C|D| | |
-|-|-|-|-|-|-|-
- space-between：两端对齐，项目之间的间隔都相等。

 |A| |B| |C| |D
-|-|-|-|-|-|-
- space-around：每个项目两侧的间隔相等。所以，项目之间的间隔比项目与边框的间隔大一倍。

 | |A| | |B| | |C| |
-|-|-|-|-|-|-|-|-|-

> ==align-items== 属性定义项目在交叉轴上如何对齐
- stretch（默认值）：如果项目未设置高度或设为auto，将占满整个容器的高度

A|B|C|D
-|-|-|-
A|B|C|D
A|B|C|D
- flex-start：交叉轴的起点对齐

A|B|C|D
-|-|-|-
&nbsp;| | |
&nbsp;| | |
- flex-end：交叉轴的终点对齐

&nbsp;| | |&nbsp;
-|-|-|-
&nbsp;| | |
A|B|C|D
- center：交叉轴的中点对齐

&nbsp;| | |&nbsp;
-|-|-|-
A|B|C|D
&nbsp;| | |
- baseline: 项目的第一行文字的基线对齐

> ==align-content== 属性定义了多根轴线的对齐方式。如果项目只有一根轴线，该属性不起作用
- stretch（默认值）：轴线占满整个交叉轴

A|B|C|D|E|F
-|-|-|-|-|-
G|H|I|J|K|L
A|B| | | |
- flex-start：与交叉轴的起点对齐

A|B|C|D|E|F
-|-|-|-|-|-
G|H| | | |
&nbsp;| | | | |
- flex-end：与交叉轴的终点对齐

&nbsp;| | | | | |
-|-|-|-|-|-
A|B|C|D|E|F
G|H| | | |
- center：与交叉轴的中点对齐

&nbsp;| | | | | |
-|-|-|-|-|-
A|B|C|D|E|F
G|H| | | |
&nbsp;| | | | |
- space-between：与交叉轴两端对齐，轴线之间的间隔平均分布

A|B|C|D|E|F
-|-|-|-|-|-
&nbsp;| | | | | |
G|H|I|J|K|L
&nbsp;| | | | |
M|N| | | |
- space-around：每根轴线两侧的间隔都相等。所以，轴线之间的间隔比轴线与边框的间隔大一倍

&nbsp;| | | | | |
-|-|-|-|-|-
A|B|C|D|E|F
&nbsp;| | | | | |
&nbsp;| | | | | |
G|H|I|J|K|L
&nbsp;| | | | |

## 项目的属性
[link](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)哈哈

## 实例
[link](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)
