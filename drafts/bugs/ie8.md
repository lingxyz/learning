- 上传文件按钮 改样式 （`<input type="file" >`）

有很多种方法，比如将其隐藏，然后通过`$("[type='file']").click()`来触发。

但是在IE8中隐藏无效，可设置透明度来实现兼容:

```css
input[type="file"] {
    opacity: 0;
    filter: alpha(opcity=0);    //<= IE8
}
```

- 不支持不用var声明全局变量，加window或者在作用域之外用var声明

- 渐进识别的方式，从总体中逐渐排除局部

  首先，巧妙的使用“\9”这一标记，将IE游览器从所有情况中分离出来。
  接着，再次使用“+”将IE8和IE7、IE6分离开来，这样IE8已经独立识别。

  ```css
.bb {
    background-color:#f1ee18; /*所有识别*/
    .background-color:#00deff\9; /*IE6、7、8识别*/
    +background-color:#a200ff;/*IE6、7识别*/
    _background-color:#1e0bd1;/*IE6识别*/
}
```
