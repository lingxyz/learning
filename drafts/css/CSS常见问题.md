4.7.1 CSS的编码风格
常见有两种：多行式和一行式
区别：可读性，开发速度，CSS文件大小
推荐：一行式(调试工具更强大了)

4.7.2 id 和 class
区别：
  1. 同一个网页，id只能出现一次，class多次
  2. id的权重为100，class为10
  3. 原生js支持通过id选择html标签，但不支持class

4.7.3 CSS hack
常用方式归纳：
  1. IE条件注释法(微软官方推荐)
codeList 4-35 只在IE下生效
<!--[if IE ]>
<link type="text/css" rel="stylesheet" href="a.css">
<![endif]-->

只在IE6下生效
<!--[if IE 6]>
code…
<![endif]-->

范围：lt  gt  lte  gte  ！
            <   >    ≤    ≥     !=

只在 IE6 以上版本有效
if gt IE 6
只在 IE7 不生效
if ! IE 7

只要在html中的代码都可用这种方式选择性加载(同样可应用于style和script)

优点：兼容性最好
缺点：增加开发维护成本

2.选择符前缀法
原理：在CSS选择符前加一个只有特定浏览器才能识别的前缀，从而让某些样式只针对特定浏览器生效。
*html IE6
*+html IE7

codeList 4-43 选择符前缀hack 法
style
.test{width:100px;}
*html .test{width:100px;} /*only for IE 6*/
*+html .test{width:100px;} /*only for IE 7*/
style

优点：可维护性强
缺点：向后兼容性存在风险，不能用在内联样式上

3.样式属性前缀法
_ IE6
* IE 6、7

codeList 4-44 样式属性前缀hack法
style
.test{width:80px;*width:70px;_width:60px;}
style
聚合度高，可用于内联样式，但向后兼容性存在风险

4.7.4 解决超链接访问后hover样式不存在问题
love hate 原则

4.7.5 hasLayout
hasLayout:：css解析引擎。设计初衷用于辅助块级元素的核模型解析。用于行内元素时引发一些特殊效果。
触发方法：设置width height值，如早期的height:1%，设置position:relative,设置zoom:1

正常用zoom:1，无效时用position:relstive,但会带来一点副作用

4.7.6 块级元素和行内元素的区别
行内元素的margin padding在水平方向上产生边距效果，竖直方向不会产生边距效果，但仍然有padding。
相关属性:display:block/inline/inline-block;

4.7.7 display:inline-block和hasLayout
display属性的值:block inline none (前三种IE兼容) inline-block  table-cell list-item
IE 6.7中inline-block触发hasLayout，使行内元素作为行内块状元素解析，但是解析后的元素是底对齐，设置*vertical-align:-10px;解决
具有inline-block属性的标签:如 img button
