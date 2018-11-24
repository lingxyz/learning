- 圆角：
```css
border-radius: 5px 4px 3px 2px; /* 四个半径值分别是左上角、右上角、右下角和左下角，顺时针 */
```
- 阴影：

box-shadow: X轴偏移量 Y轴偏移量 [阴影模糊半径] [阴影扩展半径] [阴影颜色] [投影方式];

[阴影扩展半径]可省略

投影方式如 inset 可以写在开头或结尾，多个阴影用逗号隔开

例子：
```css
.box_shadow{
     box-shadow:4px 2px 6px #f00, -4px -2px 6px #000, 0px 0px 12px 5px #33CC00 inset;
}
```

- 边框图片

border-image
- R(red)G(green)B(blue)A(alpha)颜色值

RGB为颜色取值，范围0-255或0.0%-100%

alpha为透明度，范围0-1

- 渐变色
linear线性渐变，radial径向渐变
linear(方向，颜色，颜色，…)
方向默认180deg,相当于to bottom
```css
background-image:linear-gradient(to left, red, orange,yellow,green,blue,indigo,violet);
```

- 字体超出长度省略
```css
.ellipsis {
    text-overflow:ellipsis;
    white-space:nowrap;(word-wrap:normal)
    overflow:hidden;
}
```
